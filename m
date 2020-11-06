Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D09C2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 11:33:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDDA2206DC
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 11:33:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iCHWLp25"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDDA2206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sS4TB/V55ivU3wcKYEl3x21YmI3OLG+pIqqBfp/5q0k=; b=iCHWLp25Rh/AEa0nj2kVLFC07
	UbJtaLz6Zaiyxp+HZPBsy+N88+hOrJMFJU10lRsdA7MpxPDg82vz1917aUVz0iYxR7iUso62wBEoA
	2LB2QhfxOfhN2M0BbvZtHsGAkTHYIsve1rf7t5o4/eOdv6cQTIQaHEKmIRgZXDlWUMFx3/2mX48mT
	3UtCNKaksmMIN97pNPkmruYnIrPzy+JtPne88A5jjSVeuvO3XAECSuCg28SpiHL9q+9D6d+u4u6k+
	zFEXivTMCjxdx+/D7yLWv6udWRQ9/1er4EIBxTdekjTg5lWr31a+p/2FWShi1iBX/52nRavz54C/x
	C/ofvuhgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kazzC-0004P6-4D; Fri, 06 Nov 2020 11:32:54 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kazz9-0004ON-R5
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 11:32:52 +0000
Received: from aletheia.cgn.bolug.org ([213.168.126.62]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M3VAI-1kbYDH3HSE-000aTP; Fri, 06 Nov 2020 12:32:37 +0100
Received: by aletheia.cgn.bolug.org (Postfix, from userid 1000)
 id 3CDDB12003FE; Fri,  6 Nov 2020 12:32:36 +0100 (CET)
Date: Fri, 6 Nov 2020 12:32:36 +0100
From: Karsten Merker <merker@debian.org>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH v3] RISC-V: Fix the VDSO symbol generaton for
 binutils-2.35+
Message-ID: <20201106113236.GA22277@aletheia.cgn.bolug.org>
References: <20201106045902.GA2585953@ubuntu-m3-large-x86>
 <mhng-e82ecf40-679a-41ed-b2b1-69c64a78f0b2@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-e82ecf40-679a-41ed-b2b1-69c64a78f0b2@palmerdabbelt-glaptop1>
X-No-Archive: yes
X-Provags-ID: V03:K1:35EEufcnseGM08J12jUkxtkOnGNHmhEbTxRRb1k7EHjfgtrsh41
 XfJM4N3Y6Z1BGq9Wt88RlnfA1UPcL+GoSOXrJXSGQzE6xLsbqKZom4+hliveljMTedou8fR
 iVIBA1sCuz8c9UrGsDQweFrMlsVPize63ckzMdDg8NTZ5SXYh04tVSdXpxpkSb4aHQ3gLas
 c1xIuNapg+5nhbsIqUugA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TBLciZvbPTs=://r9DluOGG1fbZFJnC5OAV
 dedExHJ8Uj9O/oUwS4TC1psTfxIPqcJreAHv6OiWVo1JBpiYosonKbJPoDncLnJyDoMMMltNQ
 IG7zhI7+yqdtIblp7owFMdpGkk0fMGB745YM5mex8FgSdLJNA1Kxl2Ey7xFZGz8lOJvHzWAwe
 ecORy1/6HlQhGl3mdwNBqnzaOTxEOIsOCrkpZhL68pknPAmgBlV8wG8Tkj6pU0pNzwxJHH4ZW
 zr6LT5w+2BnYOSePPqsS3MrDihYANO3Ji4bhQwPrEg+WjYGz6TvKoC+S/jbEKJWjfUh4RtkGy
 BNf5rUaLsGFNGMmu+LBlY2WwTCb7aES1zjZBZpjsNJKMpyHASI+yapuoDs1hm0EuqKKgu6+7g
 bWFCUq4pIo2kGnpRN6P/AhXKGyNuoXXinkcns3lYscYeT4Tg+kfFFxRz3yjRb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_063252_100273_CAD3392A 
X-CRM114-Status: GOOD (  10.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org,
 clang-built-linux@googlegroups.com, natechancellor@gmail.com,
 kernel-team@android.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBOb3YgMDUsIDIwMjAgYXQgMDk6MTI6MjVQTSAtMDgwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cgo+IEkganVzdCBpbnN0YWxsZWQgRGViaWFuJ3MgdG9vbGNoYWluLCB3aGljaCBpcyBM
TFZNIDkuICBJSVJDIHRoYXQncyBwcmV0dHkKPiBhbmNpZW50IFdSVCBSSVNDLVYsIHNvIG15IGd1
ZXNzIGlzIHRoYXQgaXQncyBqdXN0IGEgbG9uZyB3YXkgZnJvbSBidWlsZGluZwo+IExpbnV4LgoK
SGVsbG8gUGFsbWVyLAoKSSBoYXZlbid0IHVzZWQgdGhlbSBteXNlbGYgeWV0LCBidXQgRGViaWFu
IGhhcyBjbGFuZy0xMS9sbHZtLTExCnBhY2thZ2VzLCBhbHRob3VnaCBvbmx5IGluIHRoZSAiZXhw
ZXJpbWVudGFsIiBzdWl0ZSB3aGljaCBpc24ndAplbmFibGVkIGJ5IGRlZmF1bHQuCiAKWW91IGNh
biBpbnN0YWxsIHRoZW0gYnkgYWRkaW5nIGEgY29ycmVzcG9uZGluZyBlbnRyeSB0byAKL2V0Yy9h
cHQvc291cmNlcy5saXN0LCBzdWNoIGFzCgogIGRlYiBodHRwOi8vZGViLmRlYmlhbi5vcmcvZGVi
aWFuLXBvcnRzLyBleHBlcmltZW50YWwgbWFpbgogIChvbiBhIHJpc2N2NjQgc3lzdGVtKQoKcmVz
cGVjdGl2ZWx5CgogIGRlYiBodHRwOi8vZGViLmRlYmlhbi5vcmcvZGViaWFuLyBleHBlcmltZW50
YWwgbWFpbgogIChvbiBhbiBhbWQ2NCBzeXN0ZW0pCgphbmQgcnVubmluZwoKICBzdWRvIGFwdC1n
ZXQgdXBkYXRlICYmIHN1ZG8gYXB0LWdldCAtdCBleHBlcmltZW50YWwgY2xhbmcgbGx2bQoKUmVn
YXJkcywKS2Fyc3RlbgotLSAKSGllcm1pdCB3aWRlcnNwcmVjaGUgaWNoIGF1c2Ryw7xja2xpY2gg
ZGVyIE51dHp1bmcgc293aWUgZGVyIFdlaXRlcmdhYmUKbWVpbmVyIHBlcnNvbmVuYmV6b2dlbmVu
IERhdGVuIGbDvHIgWndlY2tlIGRlciBXZXJidW5nIHNvd2llIGRlciBNYXJrdC0Kb2RlciBNZWlu
dW5nc2ZvcnNjaHVuZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
