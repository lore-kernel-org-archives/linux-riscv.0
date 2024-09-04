Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEBFCD4847
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 18:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvWhHUmn+ntngHdNz/W5LUr66JzH1n8Ap4Tg3WK0ffU=; b=VoUnGi9Vw5tDcj
	pGXFSdthYg5yT0H8RiIdqc/CvyxSftxNvJeVQDMbooH/mrurIyMthn7v7Mm7LSxATWGEhPl0Ll0v3
	dY+J6VWHGL5ptZaqY5RTs0MlEBqJTTqtzPEYOZibwdKhAsPkhHSecmkeXOYDF909ZjEqZl3tVRt6c
	8h+SOSR2lsefCSh1tdNLOny4nlsoUc8U7JTJvHm6EqESrXFwnMMJVV/PaJ4Ud8Jgs7oXIdSGCidbj
	8Q1n0lEfsd0+ULE/5wrqgI5bsoFrMV07P5XR8fAOEybrASxNjZGYcWlKblM9KGgsFRWvgBMuH8q0G
	eSIuY9BvzUnY0daf3JBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slv4P-00000005gZA-2iwu;
	Wed, 04 Sep 2024 18:49:33 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slv4M-00000005gY3-13f3
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 18:49:31 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2d8f06c2459so2245151a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 11:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725475769; x=1726080569; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PPxKCIgg8NU2pZMqCaHzzO10WCLKFNPnNk2iyFDphQ=;
        b=aL4dRj6FZsGFqdoxUl1ckfRz37c23R6HUGrqHYdqCRWr3FpNZV73d9zuNrTEt3OfTN
         I41zAHnhyjDcxGx4Kenmy3q+ryytqFHRnppddfP1LrSzUGXB0uq065o4roAyuluVlZN0
         XtljhvjsJqNjtvg5tG5IVw0v9xl/mLltwp4fdYgDscS2vdXZdFy4VloyP5xN8gqAY4jU
         rdbeoxqe27ujyNz5aL7vNi7e/0yFkhpyccHHw58gCKDeaPXqO5H8WaemV8nT3WNo2M5H
         w+dFdUcCBjq8OOCfpxwtHaZSVmUHD1qYT3+XH1eTQu63ZVRaKx3frEsYHEvcwO8YSNHy
         iTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475769; x=1726080569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PPxKCIgg8NU2pZMqCaHzzO10WCLKFNPnNk2iyFDphQ=;
        b=STElTVLu3cf1e2scaNWB3sPB4qC3CFghE+GsZ4KD/Q/GHE0qU/Ug57ZaJ2b6abUpKq
         VC/8jwCL+7pV+fOKOTadLSn+e3FY2ol5yGe8zaT7FTtNROgDPm4JFkdRLeHktQt/TLcZ
         +u4S99S1+rif0gWj6B/DsngRcF3YK+ywPnsHuRDAqVBY2f0ALLz5222nihhmpzA35rKs
         TXLjLeiUhTZ1KzTCFrH8vgI9WMMYOUTYRIb95VZ6AFBW8WPf1YiG4p0OZxTfM7MbZxVl
         HCiBHNE6ecwbRZw3LmxllRMyIb7nvEExwnx7uealSLLG2+KP1VapkopA1FjnVWf/wTK5
         hJmw==
X-Forwarded-Encrypted: i=1; AJvYcCUreSqMUmDTVuJPY0xOWALoUu/pmgYVSWHGgHR3LQJ16oGs5QsjdBelA9L5xo3uMOiZtxGgF0E4TlHcEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YylM6kTvRe6H+EWZwLfSdrTTwZscpzNZD+unThNJ0xSlWDiRZ/w
	mIBkhPtJjgQglq6IxdRfpWwsUxPePSGqI4N3dTadLY9fnCJpnTIoWwVgGz1CjaxSe87FjiXewgY
	GsQ2K61j71gA10+KHII8jL1Z68dw=
X-Google-Smtp-Source: AGHT+IHAyCABA6IyD3KDvbfAF9hLyov6gtHJk/gTVL+5Jg1mfrvGZcCnzOvvzO7mxLGrZpSZAdMU5iljo3efFSohAZM=
X-Received: by 2002:a17:90b:4b02:b0:2d3:bb9b:ce64 with SMTP id
 98e67ed59e1d1-2da55a44a8cmr8489121a91.30.1725475768933; Wed, 04 Sep 2024
 11:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240904141951.1139090-1-pulehui@huaweicloud.com> <20240904141951.1139090-2-pulehui@huaweicloud.com>
In-Reply-To: <20240904141951.1139090-2-pulehui@huaweicloud.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 4 Sep 2024 11:49:15 -0700
Message-ID: <CAEf4BzaW6UfJGFK5hy5JQYsf3qwiqQ81h4Awtkj3XtKv-HKRrA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 01/10] selftests/bpf: Adapt OUTPUT appending
 logic to lower versions of Make
To: Pu Lehui <pulehui@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	netdev@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_114930_311904_B7EA37AA 
X-CRM114-Status: GOOD (  16.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgNCwgMjAyNCBhdCA3OjE34oCvQU0gUHUgTGVodWkgPHB1bGVodWlAaHVhd2Vp
Y2xvdWQuY29tPiB3cm90ZToKPgo+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+
Cj4KPiBUaGUgJChsZXQgLi4uKSBmdW5jdGlvbiBpcyBvbmx5IHN1cHBvcnRlZCBieSBHTlUgTWFr
ZSB2ZXJzaW9uIDQuNCBbMF0KCkVkdWFyZCwgc2VlbXMgbGlrZSB0aGUgbXlzdGVyeSBpcyBmaW5h
bGx5IHNvbHZlZC4KCldlIHdlcmUgYWN0dWFsbHkgY29uc2lkZXJpbmcgcmVtb3ZpbmcgdGhlIEZF
QVRVUkUtRFVNUCBmdW5jdGlvbmFsaXR5CmZyb20gQlBGIHNlbGZ0ZXN0cywgYnV0IGl0J3MgZ29v
ZCB0byBoYXZlIGEgZml4IG5ldmVydGhlbGVzcywgdGhhbmtzIQoKPiBhbmQgYWJvdmUsIG90aGVy
d2lzZSB0aGUgZm9sbG93aW5nIGV4Y2VwdGlvbiBmaWxlIG9yIGRpcmVjdG9yeSB3aWxsIGJlCj4g
Z2VuZXJhdGVkOgo+Cj4gICAgICAgICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGZGRUFUVVJF
LURVTVAuc2VsZnRlc3RzCj4gICAgICAgICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGZmZWF0
dXJlLwo+Cj4gQ29uc2lkZXJpbmcgdGhhdCB0aGUgR05VIE1ha2UgdmVyc2lvbiBvZiBtb3N0IExp
bnV4IGRpc3RyaWJ1dGlvbnMgaXMKPiBsb3dlciB0aGFuIDQuNCwgbGV0IHVzIGFkYXB0IHRoZSBj
b3JyZXNwb25kaW5nIGxvZ2ljIHRvIGl0Lgo+Cj4gTGluazogaHR0cHM6Ly9saXN0cy5nbnUub3Jn
L2FyY2hpdmUvaHRtbC9pbmZvLWdudS8yMDIyLTEwL21zZzAwMDA4Lmh0bWwgWzBdCj4gU2lnbmVk
LW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPiAtLS0KPiAgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQo+IGlu
ZGV4IDc2NjBkMTliNjZjMi4uOTkwNWUzNzM5ZGQwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi9NYWtlZmlsZQo+IEBAIC0xODcsOCArMTg3LDE0IEBAIEZFQVRVUkVfVEVTVFMgOj0gbGx2
bQo+ICBGRUFUVVJFX0RJU1BMQVkgOj0gJChGRUFUVVJFX1RFU1RTKQo+Cj4gICMgTWFrZWZpbGUu
ZmVhdHVyZSBleHBlY3RzIE9VVFBVVCB0byBlbmQgd2l0aCBhIHNsYXNoCj4gK2lmZXEgKCQoc2hl
bGwgZXhwciAkKE1BS0VfVkVSU0lPTikgXD49IDQuNCksIDEpCj4gICQobGV0IE9VVFBVVCwkKE9V
VFBVVCkvLFwKPiAgICAgICAgICQoZXZhbCBpbmNsdWRlIC4uLy4uLy4uL2J1aWxkL01ha2VmaWxl
LmZlYXR1cmUpKQo+ICtlbHNlCj4gK09VVFBVVCA6PSAkKE9VVFBVVCkvCj4gKyQoZXZhbCBpbmNs
dWRlIC4uLy4uLy4uL2J1aWxkL01ha2VmaWxlLmZlYXR1cmUpCj4gK09VVFBVVCA6PSAkKHBhdHN1
YnN0ICUvLCUsJChPVVRQVVQpKQo+ICtlbmRpZgo+ICBlbmRpZgo+Cj4gIGlmZXEgKCQoZmVhdHVy
ZS1sbHZtKSwxKQo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
