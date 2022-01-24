Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85EFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jan 2022 13:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WvmN5eRUi+VgKoDRQ4UUpv9gFYj3zQTP2lPTRNy4wm4=; b=x+ENhwGHDoBO5w
	lRPUfxI9Dil/2mnjAFK50Z2xOwRTLHL2nNGQFrajhtCW2MMgn5Bw5stnSIV7ribDx537UVvno+ewA
	Fa4PuNb6qEiYqzDJYNuFjzXwBMJPfxOrfyTDl9afwY0BEskX/gCj2bDCEzg3bii1MaQGCCOLvD50H
	3bgo76yYECfc0I4J30wT9gtp5Z973B70BxQ8DMB84/vPqg1W7Wl7t6TCQn/n5qzfuOp7OIcpT5Lww
	1Uf4a4c0TcSxqV9cTSenQY4qYqEDPx9BxXZu2xkzAI/Z+INn8hDQYb4DW5aY+Mc19ZiS43amAUgaN
	KuGt8WkXlk/cU5SX2kag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBzkQ-003YBk-C2; Mon, 24 Jan 2022 13:51:06 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBzkK-003YAT-G7
 for linux-riscv@lists.infradead.org; Mon, 24 Jan 2022 13:51:02 +0000
Received: by mail-ej1-x631.google.com with SMTP id p15so21563925ejc.7
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jan 2022 05:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=PDlRKMHl7GugFy5S9tQt7w/NIMxpnumttbOD/F0NTf0=;
 b=kimvkb3R5G0CEro7TgWQdVTWcy2ILaXmNtRRfcBSmyaUR6GOxQ9Xsgn5NdB9x62xzQ
 3+GhV8Sx3rFMq1iXNFNFcruS/liCjbHp0D/SsVGRY9r9bgz3iLngUVgnN4as74urY7HK
 IqCfsVOYk6YBCcmyDKapFdfsOv8QOiODBhbgkkxZRfG2BqZo4uLpXBicM7T9vI4/kk6x
 Yyla2lpP/+6opvJKgolqnWyE/MUEZMibZVuPLY93+reCLG87Fn4zu6Z9NrW5Et382q9r
 TtU5UwxosLRCFexvEFRukLxFWNBnaXf0WMPt5YkcyZfYOH95O2fJCPEgGFbTpYDpG/MM
 Es7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=PDlRKMHl7GugFy5S9tQt7w/NIMxpnumttbOD/F0NTf0=;
 b=RbuQLaAgWA7SZ8tN/XfXJuULr9w+qDqTMc9HLPP4XtznjHgiAZDLo9aCmpSHBqbDYr
 cNX1oVecewqI3XI88Y/oCkimFoHmPVZJ7Pr6+wjnIttrpUvU9LhqLPMHj+13SVGZlXuE
 PJfZ1lTK7GdFfd2to3BX4ptSXE9fq8ELAUzAyVayUA9hRPFOkD+0ByByTT+kOgeTanJT
 zfXZr/F1w9wDMa+fG2s1L+VsxvFtr0Ey/tu5uXh3x6K/8DB0Zfn8QK9j+6e4ABerUirP
 XDWf9cU/Ztjp/+DIBifBli3GBoAYltJ0PD9HV8a/zZWK8lGoJdhu9Sra5Num12tax3fG
 SEaA==
X-Gm-Message-State: AOAM531J3Nk5h1ejobEOPZTwznbcU68xtZ+0fjOMqGpnyD8CnFwyOvUm
 EvkQX3vJqd+44NQi/QjlIP0UmMMYhBSZgAvr3QA=
X-Google-Smtp-Source: ABdhPJw0FzeEMIrK3oS5aVsLL93Sq9w3AluPY+drKeoshVpm0RWNZsaZsbstTfL3RegMMsVPz9vNog+sLvffpiglxpE=
X-Received: by 2002:a17:906:a42:: with SMTP id
 x2mr13079846ejf.125.1643032257706; 
 Mon, 24 Jan 2022 05:50:57 -0800 (PST)
MIME-Version: 1.0
From: Kito Cheng <kito.cheng@gmail.com>
Date: Mon, 24 Jan 2022 21:50:46 +0800
Message-ID: <CA+yXCZA014NeRLJeYqPmomuzDM=6dC_HczxE+_QRTzHZA3sLow@mail.gmail.com>
Subject: RISC-V GNU toolchain bumping default ISA spec to 20191213
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Andrew Waterman <andrew@sifive.com>, 
 Nelson Chu <nelson.chu@sifive.com>, jim.wilson.gcc@gmail.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_055100_572689_960FF506 
X-CRM114-Status: GOOD (  10.33  )
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

SGkKCkl04oCZcyBLaXRvIENoZW5nIGZyb20gdGhlIFJJU0MtViBHQ0MgY29tbXVuaXR5LCBqdXN0
IHNoYXJpbmcgc29tZSBuZXdzCmFib3V0IHRoZSBkZWZhdWx0IElTQSBzcGVjIHZlcnNpb24gdGhh
dCBoYXMgYmVlbiBidW1wZWQgdG8gMjAxOTEyMTMgb24KYm90aCBSSVNDLVYgR0NDIGFuZCBiaW51
dGlscyByZWNlbnRseSwgYW5kIHRoYXQgaGFzIG9uZSBtYWpvcgppbmNvbXBhdGliaWxpdHkgaXNz
dWUgYmV0d2VlbiBjdXJyZW50IGRlZmF1bHQgSVNBIHNwZWMgdmVyc2lvbnMuCgpUaGUgbWFqb3Ig
aW5jb21wYXRpYmlsaXR5IGlzc3VlIGlzIHRoZSBjc3IgcmVhZC93cml0ZSAoY3NyciovY3Nydyop
Cmluc3RydWN0aW9ucyBhbmQgZmVuY2UuaSBpbnN0cnVjdGlvbiBoYXMgc2VwYXJhdGVkIGZyb20g
dGhlIGBJYApleHRlbnNpb24sIGJlY29tZSB0d28gc3RhbmRhbG9uZSBleHRlbnNpb25zOiBaaWNz
ciBhbmQgWmlmZW5jZWk7IHNvCnlvdSBtaWdodCBnZXQgZXJyb3IgbWVzc2FnZXMgbGlrZSB0aGF0
OiB1bnJlY29nbml6ZWQgb3Bjb2RlIGBjc3JyYC4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIyBIb3cgdG8gcmVzb2x2ZSB0aG9zZSBpc3N1ZXM/CgpIZXJlIGlzIHR3byBzb2x1
dGlvbiB0byByZXNvbHZlOgoKLSBGaXJzdCBvbmUgaXMgd2hhdCB3ZSByZWNvbW1lbmQsIGFkZGlu
ZyB6aWNzciBhbmQvb3IgemlmZW5jZWkgdG8geW91cgotbWFyY2ggb3B0aW9uLCBlLmcuIC1tYXJj
aD1ydjY0aW1hYyBiZWNvbWUKLW1hcmNoPXJ2NjRpbWFjX3ppY3NyX3ppZmVuY2VpCgotIFRoZSBz
ZWNvbmQgb25lIGlzIGEga2luZCBvZiB3b3JrYXJvdW5kLCB1c2luZyAtbWlzYS1zcGVjPTIuMiB0
bwpmb3JjZSBSSVNDLVYgR0NDIHVzaW5nIHRoZSBvbGRlciBJU0Egc3BlYyB2ZXJzaW9uLCBob3dl
dmVyIHRoaXMgaXMKc3Ryb25nbHkgICpOT1QqIHJlY29tbWVuZGVkLgoKSW4gY2FzZSB5b3Ugd2Fu
dCBldmVyeXRoaW5nIGxpa2UgYmVmb3JlLCB5b3UgY2FuIGFkZAotLXdpdGgtaXNhLXNwZWM9Mi4y
IGJ1aWxkIG9wdGlvbiBmb3IgR0NDIGFuZCBiaW51dGlscywgdGhlbiB0aGUKdG9vbGNoYWluIHdp
bGwgZGVmYXVsdCB1c2luZyB0aGUgb2xkIHZlcnNpb24gYW5kIHdvcmsgYXMgYW4gb2xkZXIgR05V
CnRvb2xjaGFpbiByZWxlYXNlLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoj
IFdoeSBHQ0MvYmludXRpbHMgYnVtcCB0aGF0PwoKVGhlIGRlZmF1bHQgSVNBIHNwZWMgdmVyc2lv
biB3YXMgc2V0IHRvIDIuMiBmb3IgbG9uZyB0aW1lLCBob3dldmVyIHRoZQpzcGVjIGlzIHJlbGVh
c2VkIGF0IE1heSwgMjAxNywgd2hpY2ggaXMgNSB5ZWFycyBhZ28sIGFuZCBSSVNDLVYgaGFzIGF0
CmxlYXN0IHR3byBJU0Egc3BlYyByZWxlYXNlIGFmdGVyIHRoYXQsIHNvIHdlIGJlbGlldmUgdGhh
dOKAmXMgdGltZSB0bwpidW1wLCBhbmQgd2UgYWxzbyByYWlzZSB0aGUgZGlzY3Vzc2lvbiBvbiB0
aGUgUklTQy1WIEJvRiBhdCBMaW51eApwbHVtYmVyLCB3ZSByZWFjaCBhIGNvbnNlbnN1cyBpcyB0
aGF0IHdlIHNob3VsZCBtb3ZpbmcgZm9yd2FyZCBldmVuCnRoYXQgaGF2aW5nIGluY29tcGF0aWJs
ZSBpc3N1ZS4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIyBXaHkgYnVtcCB0
aGF0IHNvIGxhdGU/CgpXZSB3b3JyaWVkIGFib3V0IHRoZSBpbmNvbXBhdGliaWxpdHkgaXNzdWUs
IGJ1dCB3ZSByZWFsaXplZCB0aGF0IGlzCnVuYXZvaWRhYmxlLCBhbmQgUklTQy1WIGlzIGdyb3dp
bmcgdmVyeSBxdWlja2x5IGluIHRoZSBwYXN0IHllYXIsIHNvCndlIGJlbGlldmUgaXQgd291bGQg
YmUgYmV0dGVyIHRvIG1vdmUgZm9yd2FyZCBub3cuCgoKIyBXaHkgaXMgdGhlcmUgYW4gaW5jb21w
YXRpYmlsaXR5IGlzc3VlIHRoZXJlPyBXaHkgY2FuJ3QgeW91IGF2b2lkIHRoYXQ/CgpUaGF0IGlz
IGJlY2F1c2UgdGhlIFJJU0MtViBJU0Egc3BlYyBoYXMgY2hhbmdlZCwgd2UgYmVsaWV2ZSB0aGUK
dG9vbGNoYWluIHNob3VsZCBob25vciB3aGF0IHNwZWMgd3JpdHRlbi4KCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiMgV2hpY2ggSVNBIHNwZWMgdmVyc2lvbnMgYXJlIHN1cHBv
cnRlZCBieSBHTlUgdG9vbGNoYWluIG5vdz8KCkN1cnJlbnRseSB3ZSBzdXBwb3J0IDIuMiAyMDE5
MDYwOCBhbmQgMjAxOTEyMTMuCgoyLjI6Cmh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1p
c2EtbWFudWFsL3JlbGVhc2VzL3RhZy9yaXNjdi11c2VyLTIuMgoKMjAxOTA2MDg6Cmh0dHBzOi8v
Z2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL3JlbGVhc2VzL3RhZy9SYXRpZmllZC1J
TUZEUUMtYW5kLVByaXYtdjEuMTEKCjIwMTkxMjEzOgpodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yv
cmlzY3YtaXNhLW1hbnVhbC9yZWxlYXNlcy90YWcvUmF0aWZpZWQtSU1BRkRRQwoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQojIElzIHRoZXJlIGFueSBuZXdlciBJU0Egc3BlYyBz
dXBwb3J0ZWQ/IEl04oCZcyAyMDIyIQoKMjAxOTEyMTMgaXMgYWxyZWFkeSAyIHllYXJzIGFnbywg
YnV0IFJJU0MtViBkaWRu4oCZdCBoYXZlIGZ1cnRoZXIgZm9ybWFsCklTQSBzcGVjIHJlbGVhc2Ug
YWZ0ZXIgdGhhdCwgd2hhdCB3ZSBjYW4gcHJvbWlzZSBpcyB0aGF0IFJJU0MtViBHTlUKdG9vbGNo
YWluIHdpbGwgc3VwcG9ydCBzb29uIGlmIElTQSBzcGVjIGhhcyBuZXdlciByZWxlYXNlLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
