Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAE6CA1009
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 19:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3S9dkJp+b715dMnYq2TF5u/1/K+B+I+wqkN3Ia4EFI=; b=GqzIr2Yu0GfmDW
	Prx6KXAnUXWdGoGAWud8Ob5pemFuXVOKMEd5Ua9DAOO5mYXcoq03m/vBUe18yG7DqzCC8KKx3a57r
	VooPIN4eGCCl+06OES2qMy8OPcqBLMo/f8ALMFaIg1R0g3SQW1yJcsfKJOtuGmyGt0Q+VzuFDWqXp
	L70nnBHSrxGE3QG3rGdg6H5slFSq+HqoN3EKaSFVB8ZWp5HgV+Gf/1W/0XoxgDYM+35rJXkgyxuui
	GIBUmaQnhe2KMu1XpkG6+UdrSE91qoRxRcvMsvvozdfFMNJ8Bdjf3SQhR2Gp/Zi6cnsLitFJAvldY
	++ZuIIV5qd4/P9XwCr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk7Xc-00000007WOC-48lW;
	Fri, 30 Aug 2024 19:44:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk7O7-00000007UPC-0NBb
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 19:34:29 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71456acebe8so1766369b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2024 12:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725046466; x=1725651266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T4DD/L1ycBynDsagGFuV4APxCCk9WOAuvtMlSnh1e8=;
        b=N6cSVoKK2YyV+MT5yghBsfpPcMPuvMjsieL2FYnq1XUVhd/SAnGW86CEz0KB8u611a
         IPoFPXB0CX0VJ9Doq+8oIOSSUeKcYSENEMpaW4kqmo7BYlUOynySwRQChbtx6gx+CVhb
         WVUFAFIM5nZHC4Ny5jKZguqs17kWSYqiyE1DTawrYA0FkRrCyB3aZg9pU7vvQr5sBlIm
         XrC6ecKntjyHcIlchFsO/HJfbzw9KrRYECmMkiKG1A1AVKSIeEteXeQg7y2pUGCrWKvG
         4M+4QKHbRWObRTmaAWErsLc5txcgwPfc3GD4FoSFQXUqnmuhLc+Go5om9sxjw8oY8pNE
         kwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725046466; x=1725651266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T4DD/L1ycBynDsagGFuV4APxCCk9WOAuvtMlSnh1e8=;
        b=B3uY0KLoDCrOQ4U0DHxsOSoFDJNUHH2eWTqIA+v2Hc2YW6X1yme4k2piB3fYpPfolw
         GDCcVA/Vg/sXwvE0kS+znmTludBSRFctHw1STdQhJLIPLLlkUCJpmEpPsDDI2xHUuP/e
         y+rsT44n3phB7L6lb9RnbW3qG8ZUa088gw8IMRpnCDt2BD2BRFamyXhCWaSsUHSTURiw
         iooa4QFNteiUz3MnG00wnms08I+36gujJNRNxcL9/9Wf5HkrrcRKPu5nM+rJdDdUYCl/
         vsCEB0j+LmqFuPbad5vVUrBTb+H4Hg3C+hmviM/1rHcD3DZgVTbdzBsIMwdPZzHaJTxK
         bL7g==
X-Forwarded-Encrypted: i=1; AJvYcCXG3LS4HgUy+nT6s8n/yF1kGPIgaU7sDMoZDlHZrBw5XNljhnbPKiklMzfXHpLi75govPznZxBI48LJUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIjnjkwOAcllcGZo3tZFILH7+ppxbSz7vUhqYz//dJT2atuqjJ
	qzh2zh02IvL8NoFp/HPl9WzkvKjqzwDtKWN8bcOi0hjh53DMIUYm8zrYXFDFgb2/UYWvIWhPT6d
	ViHbDXZFHlVrFG6sHoIDGSmvfb9s=
X-Google-Smtp-Source: AGHT+IELhpO8EFZ0TbuW8ruGGOKl7Hd0S2qc3IfGydBhjX/AqvUfL4N+n5Dlz0dg3Xm2gvJGmq1NkzYG/nGF/B0GQR8=
X-Received: by 2002:a05:6a20:d490:b0:1c8:eb6e:5817 with SMTP id
 adf61e73a8af0-1cce0ff1851mr7151079637.5.1725046465870; Fri, 30 Aug 2024
 12:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240829133453.882259-1-pulehui@huaweicloud.com> <20240829133453.882259-2-pulehui@huaweicloud.com>
In-Reply-To: <20240829133453.882259-2-pulehui@huaweicloud.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 30 Aug 2024 12:34:13 -0700
Message-ID: <CAEf4BzbvUQ1HA6GPSF23piqbEBNVDZKZC0rB-X4LgeMpp9svYA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] libbpf: Fix accessing first syscall argument
 on RV64
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	netdev@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_123427_174662_0C56B23C 
X-CRM114-Status: GOOD (  20.92  )
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

T24gVGh1LCBBdWcgMjksIDIwMjQgYXQgNjozMuKAr0FNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29t
Pgo+Cj4gT24gUlY2NCwgYXMgSWx5YSBtZW50aW9uZWQgYmVmb3JlIFswXSwgdGhlIGZpcnN0IHN5
c2NhbGwgcGFyYW1ldGVyIHNob3VsZCBiZQo+IGFjY2Vzc2VkIHRocm91Z2ggb3JpZ19hMCAoc2Vl
IGFyY2gvcmlzY3Y2NC9pbmNsdWRlL2FzbS9zeXNjYWxsLmgpLAo+IG90aGVyd2lzZSBpdCB3aWxs
IGNhdXNlIHNlbGZ0ZXN0cyBsaWtlIGJwZl9zeXNjYWxsX21hY3JvLCB2bWxpbnV4LAo+IHRlc3Rf
bHNtLCBldGMuIHRvIGZhaWwgb24gUlY2NC4gTGV0J3MgZml4IGl0IGJ5IHVzaW5nIHRoZSBzdHJ1
Y3QgcHRfcmVncwo+IHN0eWxlIHRvIHByb3ZpZGUgYWNjZXNzIHRvIGl0IG9ubHkgdGhyb3VnaCBQ
VF9SRUdTX1BBUk0xX0NPUkVfU1lTQ0FMTCgpLgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYnBmLzIwMjIwMjA5MDIxNzQ1LjIyMTU0NTItMS1paWlAbGludXguaWJtLmNvbSBbMF0K
PiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+IC0tLQo+ICB0
b29scy9saWIvYnBmL2JwZl90cmFjaW5nLmggfCA5ICsrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
bGliL2JwZi9icGZfdHJhY2luZy5oIGIvdG9vbHMvbGliL2JwZi9icGZfdHJhY2luZy5oCj4gaW5k
ZXggOTMxNGZhOTVmMDRlLi4zODhmMzBjZjc5MTQgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGliL2Jw
Zi9icGZfdHJhY2luZy5oCj4gKysrIGIvdG9vbHMvbGliL2JwZi9icGZfdHJhY2luZy5oCj4gQEAg
LTM1MSw2ICszNTEsMTAgQEAgc3RydWN0IHB0X3JlZ3NfX19hcm02NCB7Cj4gICAqIGh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWVsZi1wc2FiaS1kb2MvYmxvYi9tYXN0ZXIv
cmlzY3YtY2MuYWRvYyNyaXNjLXYtY2FsbGluZy1jb252ZW50aW9ucwo+ICAgKi8KPgo+ICtzdHJ1
Y3QgcHRfcmVnc19fX3Jpc2N2IHsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgb3JpZ19hMDsKPiAr
fTsKPiArCj4gIC8qIHJpc2N2IHByb3ZpZGVzIHN0cnVjdCB1c2VyX3JlZ3Nfc3RydWN0IGluc3Rl
YWQgb2Ygc3RydWN0IHB0X3JlZ3MgdG8gdXNlcnNwYWNlICovCj4gICNkZWZpbmUgX19QVF9SRUdT
X0NBU1QoeCkgKChjb25zdCBzdHJ1Y3QgdXNlcl9yZWdzX3N0cnVjdCAqKSh4KSkKPiAgI2RlZmlu
ZSBfX1BUX1BBUk0xX1JFRyBhMAo+IEBAIC0zNjIsMTIgKzM2NiwxNSBAQCBzdHJ1Y3QgcHRfcmVn
c19fX2FybTY0IHsKPiAgI2RlZmluZSBfX1BUX1BBUk03X1JFRyBhNgo+ICAjZGVmaW5lIF9fUFRf
UEFSTThfUkVHIGE3Cj4KPiAtI2RlZmluZSBfX1BUX1BBUk0xX1NZU0NBTExfUkVHIF9fUFRfUEFS
TTFfUkVHCj4gKyNkZWZpbmUgX19QVF9QQVJNMV9TWVNDQUxMX1JFRyBvcmlnX2EwCj4gICNkZWZp
bmUgX19QVF9QQVJNMl9TWVNDQUxMX1JFRyBfX1BUX1BBUk0yX1JFRwo+ICAjZGVmaW5lIF9fUFRf
UEFSTTNfU1lTQ0FMTF9SRUcgX19QVF9QQVJNM19SRUcKPiAgI2RlZmluZSBfX1BUX1BBUk00X1NZ
U0NBTExfUkVHIF9fUFRfUEFSTTRfUkVHCj4gICNkZWZpbmUgX19QVF9QQVJNNV9TWVNDQUxMX1JF
RyBfX1BUX1BBUk01X1JFRwo+ICAjZGVmaW5lIF9fUFRfUEFSTTZfU1lTQ0FMTF9SRUcgX19QVF9Q
QVJNNl9SRUcKPiArI2RlZmluZSBQVF9SRUdTX1BBUk0xX1NZU0NBTEwoeCkgUFRfUkVHU19QQVJN
MV9DT1JFX1NZU0NBTEwoeCkKPiArI2RlZmluZSBQVF9SRUdTX1BBUk0xX0NPUkVfU1lTQ0FMTCh4
KSBcCj4gKyAgICAgICBCUEZfQ09SRV9SRUFEKChjb25zdCBzdHJ1Y3QgcHRfcmVnc19fX3Jpc2N2
ICopKHgpLCBfX1BUX1BBUk0xX1NZU0NBTExfUkVHKQoKSSBmZWVsIGxpa2Ugd2hhdCB3ZSBkaWQg
Zm9yIHMzOTB4IGlzIGEgYml0IHN1Ym9wdGltYWwsIHNvIGxldCdzICh0cnkKdG8pIGltcHJvdmUg
dGhhdCBhbmQgdGhlbiBkbyB0aGUgc2FtZSBmb3IgUlY2NC4KCldoYXQgSSBtZWFuIGlzIHRoYXQg
UFRfUkVHU19QQVJNbl9TWVNDQUxMIG1hY3JvcyBhcmUgdXNlZCB0byByZWFkCnB0X3JlZ3MgY29t
aW5nIGRpcmVjdGx5IGZyb20gY29udGV4dCwgcmlnaHQ/IEluIHRoYXQgY2FzZSB3ZSBkb24ndApu
ZWVkIHRvIHBheSB0aGUgcHJpY2Ugb2YgQlBGX0NPUkVfUkVBRCgpLCB3ZSBjYW4ganVzdCBhY2Nl
c3MgbWVtb3J5CmRpcmVjdGx5IChidXQgd2Ugc3RpbGwgbmVlZCBDTy1SRSByZWxvY2F0aW9uISku
CgpTbyBJIHRoaW5rIHdoYXQgd2Ugc2hvdWxkIGRvIGlzCgoxKSBtYXJrIHB0X3JlZ3NfX19yaXNj
diB7fSB3aXRoIF9fYXR0cmlidXRlX18oKHByZXNlcnZlX2FjY2Vzc19pbmRleCkpCnNvIHRoYXQg
bm9ybWFsIGZpZWxkIGFjY2Vzc2VzIGFyZSBDTy1SRS1yZWxvY2F0ZWQKMikgY2hhbmdlIFBUX1JF
R1NfUEFSTTFfU1lTQ0FMTCh4KSB0byBiZSBgKChjb25zdApzdHJ1Y3RfcHRfcmVnc19fX3Jpc2N2
ICopKHgpKS0+b3JpZ19hMGAsIHdoaWNoIHdpbGwgZGlyZWN0bHkgcmVhZAptZW1vcnkKMykga2Vl
cCBQVF9SRUdTX1BBUk0xX0NPUkVfU1lTQ0FMTCgpIGFzIGlzCgoKQnV0IGhhdmluZyB3cml0dGVu
IGFsbCB0aGUgYWJvdmUsIEknbSBub3Qgc3VyZSB3aGV0aGVyIHdlIGFsbG93IENPLVJFCnJlbG9j
YXRlZCBkaXJlY3QgY29udGV4dCBhY2Nlc3NlcyAodmVyaWZpZXIgbWlnaHQgY29tcGxhaW4gYWJv
dXQKbW9kaWZ5aW5nIGN0eCByZWdpc3RlciBvZmZzZXQgb3Igc29tZXRoaW5nKS4gU28gY2FuIHlv
dSBwbGVhc2UgY2hlY2sKaXQgZWl0aGVyIG9uIHMzOTAgb3IgUlY2NCBhbmQgbGV0IG1lIGtub3c/
IEknbSBub3QgbWFya2luZyBpdCBhcwoiQ2hhbmdlcyBSZXF1ZXN0ZWQiIGZvciB0aGF0IHJlYXNv
biwgYmVjYXVzZSB0aGF0IG1pZ2h0IG5vdCB3b3JrIGFuZAp3ZSdsbCBoYXZlIHRvIGRvIEJQRl9D
T1JFX1JFQUQoKS4KCj4KPiAgI2RlZmluZSBfX1BUX1JFVF9SRUcgcmEKPiAgI2RlZmluZSBfX1BU
X0ZQX1JFRyBzMAo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
