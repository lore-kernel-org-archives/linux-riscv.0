Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EB3D29C2E
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRzLmd2TULuIwLrMw+hmui+kkkOYlQThjJ3JBULvtYA=; b=yelGrho3e2EHUm
	M1qIEYC73qQGJk8OyxuvmK/SILmHKp3TSRQt0spkaTEjDJ+JnLToqlVQFd0ZsKN9bEa37Ah462nB6
	+JicjtlG1eM/mf4+/UPxmc4gM93kVJVEhBSh1MkIMOfhYzUHZlzamyGVOd8TYl48AUAkeIhsCWFHl
	HfPCq6QOnaGfrSPK256EELi46AjOLTWJxtgInBSz5jeNPRWfReGg88BC625Y47G9Rv+m/xWN0zEeJ
	L46JfcrxIg9pZveEyFBFbj7OwU5c2lmGCeYGj2+eKuKJiefxDbbTOP37w4nxZHsjEZAalwfEWtM1Y
	SO0Ma6QCYQdUUAQH1UIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr3C-00000002L2Y-04gj;
	Mon, 19 Jan 2026 15:20:44 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr37-00000002L1q-2cXG
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 15:20:16 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dvvK64vFmz1wMZ6;
	Mon, 19 Jan 2026 16:20:10 +0100 (CET)
DKIM-Signature: a=rsa-sha256; bh=B5bVaMYRP7fZH0t1A8JUTPFjs12q9uFq1LutIPHOLX0=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=From:To:Subject:Date:Message-ID;
        s=r1; t=1768836010; v=1;
        b=Lf/7fRjMpSy4G4Apna6ThwzImkXVKKBb2rHVKcIfnc9ROyGdAgUGBqsiuZjyhmst
         lqIAHYeY3rHd4E9J9G4cbPxn3qA56+jH+crW0BCMsBm0FnXahVAmqIGsGHqdCOCo
         6T6yTobim0OM8cKOGb7iadxvh5+eqU/nlaqZCv36B557duTnnloKCu/BprQltHHQ
         XC+C/GE3Qy4BtXoVP3FupmXkgl0DAWmOCF+i/DXe3s2PwdO0hm2Q574wrrSjdQtH
         uouC538KrFpmJl2D44nKHSocuKIhrwfHg27W5LIt3YGP/J/u6MRw7W9aIJPlOO/2
         UQSPhJDfaLWTFwRl2IHYkw==
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4dvvK504gKz1wMZ5;
	Mon, 19 Jan 2026 16:20:08 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4dvvK46L0Yz1qqlc;
	Mon, 19 Jan 2026 16:20:08 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id smdXlySC5pbE; Mon, 19 Jan 2026 16:20:08 +0100 (CET)
X-Auth-Info: g7Bbe4MRfNrSS1YHWIcgAE9qsq4ZWWmcnDyV0fCZclR14QUJ3oFtdrzw+CbcK4pk
Received: from wiesel.intern (aftr-82-135-82-149.dynamic.mnet-online.de [82.135.82.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 19 Jan 2026 16:20:08 +0100 (CET)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:7c62:722b:b9a7:1b50])
	by wiesel.intern (Postfix) with ESMTP id 0E17F79A04C7;
	Mon, 19 Jan 2026 16:20:08 +0100 (CET)
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
To: Linus Walleij <linusw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org,
	Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [PATCH] Re: Typo in pinctrl-th1520.c
Date: Mon, 19 Jan 2026 16:20:02 +0100
Message-ID: <20260119152004.166749-1-thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLmyweD1Y1E1qONC41sPF+ZE4ajh=UvT7OeX_0DJPJsLZA@mail.gmail.com>
References: <029e5e79-ae9c-4d31-b75f-8f48f359d539@muenchen-mail.de> <aWk59MT8yWcxiYKr@x1> <0733e741-ec63-4419-a08d-50b70210361b@muenchen-mail.de> <CAD++jLkmeEoynOurZoSB_sz0XfJupiJcLPyWqbTe6fQFpYJotQ@mail.gmail.com> <20260119135553.145092-1-thomas.gerner@muenchen-mail.de> <CAD++jLmyweD1Y1E1qONC41sPF+ZE4ajh=UvT7OeX_0DJPJsLZA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_072015_010144_EA404620 
X-CRM114-Status: GOOD (  21.39  )
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

Ck9uIDE5LjAxLjI2IGF0IDE1OjMyIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gT24gTW9uLCBKYW4g
MTksIDIwMjYgYXQgMjo1NuKAr1BNIFRob21hcyBHZXJuZXIKPiA8dGhvbWFzLmdlcm5lckBtdWVu
Y2hlbi1tYWlsLmRlPiB3cm90ZToKPj4gT24gTW9uLCAxOSBKYW4gMjAyNiBhdCAxMDowMDowNiAr
MDEwMCBMaW51cyBXYWxsZWlqIHdyb3RlCj4+Cj4+PiBPbiBUaHUsIEphbiAxNSwgMjAyNiBhdCA4
OjE2IFRob21hcyBHZXJuZXIKPj4+IDx0aG9tYXMuZ2VybmVyQG11ZW5jaGVuLW1haWwuZGU+IHdy
b3RlOgo+Pj4KPj4+PiBJJ20gbmV3IGluIHdvcmtpbmcgb24gdGhlIExpbnV4IGtlcm5lbCBiZWNh
dXNlIG9mIG15IEJlYWdsZVYtQWhlYWQuIE5leHQKPj4+PiB0aW1lIHdoZW4gSSBzZW5kIGEgcGF0
Y2ggSSB3aWxsIHVzZSBnaXQgc2VuZC1lbWFpbC4KPj4+Cj4+PiBXaWxsIHlvdSBzZW5kIGEgcHJv
cGVyIHBhdGNoIGZvciB0aGlzPwo+Pj4KPj4+IE90aGVyd2lzZSBwZXJoYXBzIERyZXcgY2FuIHNl
bmQgYSBwcm9wZXIgcGF0Y2ggdG8gZml4IHRoaXMgYnVnCj4+PiBzbyBJIGNhbiBhcHBseSBpdD8K
Pj4KPj4gSSBob3BlIHRoaXMgdGltZSB0aGUgcGF0Y2ggaXMgcHJvcGVyIGZvcm1hdHRlZC4KPgo+
IE5haCBpdCBkb2Vzbid0IHdvcmsuLi4gYnV0IEkgY291bGQgZml4IHRoYXQgdXAgaWYgeW91IHNl
bmQgaXQgYWdhaW4KPiBhbmQgcHJvdmlkZSB5b3VyICJTaWduZWQtb2ZmLWJ5IiBiZWNhdXNlIG90
aGVyd2lzZSBJIGNhbm5vdCBsZWdhbGx5Cj4gYXBwbHkgaXQuCj4KCkhvcGVmdWxseSB0aGlzIHRp
bWUgZXZlcnl0aGluZyBpcyBva2F5LgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdlcm5lciA8dGhv
bWFzLmdlcm5lckBtdWVuY2hlbi1tYWlsLmRlPgotLS0KIGRyaXZlcnMvcGluY3RybC9waW5jdHJs
LXRoMTUyMC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMgYi9k
cml2ZXJzL3BpbmN0cmwvcGluY3RybC10aDE1MjAuYwppbmRleCBlNjQxYmFkNjcyOGMuLjgzZTlj
OWY3NzM3MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMKKysr
IGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMKQEAgLTI4Nyw3ICsyODcsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHBpbmN0cmxfcGluX2Rlc2MgdGgxNTIwX2dyb3VwM19waW5zW10g
PSB7CiAJVEgxNTIwX1BBRCg1LCAgUVNQSTBfRDBfTU9TSSwgUVNQSSwgUFdNLCAgSTJTLCAgR1BJ
TywgX19fXywgX19fXywgMCksCiAJVEgxNTIwX1BBRCg2LCAgUVNQSTBfRDFfTUlTTywgUVNQSSwg
UFdNLCAgSTJTLCAgR1BJTywgX19fXywgX19fXywgMCksCiAJVEgxNTIwX1BBRCg3LCAgUVNQSTBf
RDJfV1AsICAgUVNQSSwgUFdNLCAgSTJTLCAgR1BJTywgX19fXywgX19fXywgMCksCi0JVEgxNTIw
X1BBRCg4LCAgUVNQSTFfRDNfSE9MRCwgUVNQSSwgX19fXywgSTJTLCAgR1BJTywgX19fXywgX19f
XywgMCksCisJVEgxNTIwX1BBRCg4LCAgUVNQSTBfRDNfSE9MRCwgUVNQSSwgX19fXywgSTJTLCAg
R1BJTywgX19fXywgX19fXywgMCksCiAJVEgxNTIwX1BBRCg5LCAgSTJDMl9TQ0wsICAgICAgSTJD
LCAgVUFSVCwgX19fXywgR1BJTywgX19fXywgX19fXywgMCksCiAJVEgxNTIwX1BBRCgxMCwgSTJD
Ml9TREEsICAgICAgSTJDLCAgVUFSVCwgX19fXywgR1BJTywgX19fXywgX19fXywgMCksCiAJVEgx
NTIwX1BBRCgxMSwgSTJDM19TQ0wsICAgICAgSTJDLCAgX19fXywgX19fXywgR1BJTywgX19fXywg
X19fXywgMCksCi0tIAoyLjQzLjAKCkJlc3QgcmVnYXJkcwpUaG9tYXMKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
