Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92197C25B78
	for <linux-riscv@archiver.kernel.org>; Sat, 25 May 2024 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSLc1Ax/RyLRZl0YZfJDic7YbH0KYI/oZ/FdQ9eIzhY=; b=NN8BftcJeJ1Rr1
	s6c8Kg7vxSzDb3OGDtrNR2W6gzxt0jGXxgUcHsLw/A94s6keMWuh9UST7eN6DQ4Bw55yPaJyI26Kb
	8gB0MAvYFhX9Wgl1PZV1bA8R4YsglNSvGUq7p2VdJu8UUVP5oeCxPR3yJydtTLdH9Pk3Lt/ed5eeO
	jepsY2gE8MpWEG+LlbJSMezARvyEeF4y78mwD+heu7AhpjADnyVai7hEo/vJubE7R1A/2XqNrXBRo
	tF40E+oIlTVIk4qn31HIA061XamKyYsBCnYxn940skyXBwg2pTgk+Ni2LbFN+/GcaJiF3LV6VcY9+
	UDUNSpdANXihdi2IOHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAqF4-0000000AzDC-25mk;
	Sat, 25 May 2024 12:11:18 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAqF0-0000000AzCW-3HUR
	for linux-riscv@lists.infradead.org;
	Sat, 25 May 2024 12:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716639066; x=1717243866; i=markus.elfring@web.de;
	bh=oGuyy/VHQckd3cRSTJawLRY3MC0H+b0W1sAThyAgWmE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YjqQFezlxATkBtOxcUIHEn1v+9tJ9LJbSOl7dRHIdy7HoFSGeXuPxnphG74VEHII
	 6ZhJyBgo4ReHn4zdD/Uj+XERhLsW/1DDGwrifZcSzxklmfV9BpVFnv6Xk9qgOpOvW
	 WpD7YAjgLa2b7+mqcgctmArLxiwFlHyC1E5yORXOrgJ+J2uSE2/yMSbRIsd7HXzIH
	 nn8bfCwhv7MNs9Hl4P2kWh4itS0zTl8BkHcc+AULeoU3sIH5Xt10UDYju9QOTdn8z
	 FxabmID7uYAT/atJoZng+6IngrSSr4SesC/SD/It404RERt+8LLpKkC/aNvgdmYkW
	 QRXA/sCYtIg50Rgnww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MP384-1rs3pW03Q4-00XcIJ; Sat, 25
 May 2024 14:11:06 +0200
Message-ID: <b52685a3-127a-4367-b11a-54ab88467dcf@web.de>
Date: Sat, 25 May 2024 14:11:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RISC-V: add Star64 board devicetree
To: Conor Dooley <conor@kernel.org>, Henry Bell <dmoo_dv@protonmail.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <IPHlm5mOKUzYfwGy0auyufx-oPkSrtQjUjiQLbtvspD69UPX9O98iB8P2mqM8ahNaerz0yUa009f4XABRniq7aj2PUp83hbRVVhhKmqT0Ss=@protonmail.com>
 <1b55aad1-1442-41a5-acc6-16baab90c021@web.de>
 <caCBlFpvjmhO9G1A1_2qHImmuoGai2NoPYonB5RCVftq4zIrSxlP8Msh9z_FX9GwQXzfSrB40dRxy1zfxZesOJENeebWQsERa03sDvArzec=@protonmail.com>
 <20240525-dumpster-bootlace-10123081a6f2@spud>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240525-dumpster-bootlace-10123081a6f2@spud>
X-Provags-ID: V03:K1:KB0lVXM+MsqV8BunvAuq/CNlANGmoJmtaXNBiUIOvgIcUA1zhMU
 Nas5nCALipDqrdlMZm2Hj5qz2plBIF/oI2iMCtsbycKkvWGXDtrAbr6BtWRzretNVYsgBlz
 +R4QCTMl/5UEng1DnVVZ1R5PCNlA5vQShmmZP5LHbhxXDklciosgM6EGOavkhmScBKlO75Y
 2ynSEMGrAEdkaq9FX88pA==
UI-OutboundReport: notjunk:1;M01:P0:c14ACTMRubY=;QJC4K/TMIoXaAoncU4CL816gqhq
 nXFgHOR0cu9Vc1GFRSUqiRTgo703b7+M4GiAnsjRr8GsU/vMXCGwPqfk9G9Hi/jjUclsBLt+Z
 Xba2bdLgeDA0O/Nfyzt1rXY+OCeQhmCCEVJY3neJp09TOWzaQKCLUPodSBX/0axmFrTR06a2D
 C/7Mn2XlvHiVKcDirqIymb7Ebh5MbxIB1fVhkK3odjGzV2MUferGpp89W8FPRH+bMA2ok0mgd
 x5/oKhVHHrLCpeqHjgkOPIq6swuKHnWDyPOjNFdCj8YXQghsLTAHKzbkl84FEiQtEGqsKDHET
 R2kZarnVO/KC/jTVjfKp/xKvDwep7Q0N0kbrjyqWW5bi21ZCHtZW4N37+sHJKUNQZ3hWSeCnz
 a/c3jENLXrNv0pIu4zN6KhGB0m/grDBg92pz4CjU2GjsZMfQbxdncz5erBy7S/5aj/LZZ027s
 MB3CXarVc+CAKkIsMNK2HZPgdvdXoyAvM7lzIx+4TwEnBI/2SwndBD0VedGvrl6PtivLbWHTM
 TR4f/nALz1nVHJjOqDdf5eeDg+RULTYLU6nRYySIK3AEIWwAHX2lX82n0ygBLEwouTWl2QDEV
 2gK/McUNqErZ/d7ftbgA+cUPn+KSgD3PCpUXMwtbqvSb3HS6OWMz481IY2z3GqNadN9qqskUg
 WwrooZhw8KqZI0i69TYk1fyipThGSnRJwh+wP2L+TUdmRNjOGwrp6J2IofHEKWZoFVOTloxIj
 s58FUdd9ODsSrIxRJjtRwD/9GeIUOJcwBAmLVf+ODmY9iNP6jBU7ldw7P47aoIQCUfARAIYLf
 snm5H+0pMhv8AEfrlcBB640n85wsSiNnJhrKnO6CYwWSg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_051115_526724_F59073E9 
X-CRM114-Status: UNSURE (   4.22  )
X-CRM114-Notice: Please train this message.
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

Pj4+IFdvdWxkIHlvdSBsaWtlIHRvIGFkZCBhbiBpbXBlcmF0aXZlIHdvcmRpbmcgZm9yIGFuIGlt
cHJvdmVkIGNoYW5nZSBkZXNjcmlwdGlvbj8KPj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRp
b24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2g9djYuOSNuOTQK4oCmCj4+IEknbSBo
YXBweSB0byBjaGFuZ2UgaXQsIGJ1dCB3YXMgZ29pbmcgb2ZmIHRoZSBmb3JtYXQgdXNlZCBpbiBD
b25vcidzICBNaWxrdiBNYXJzIGNvbW1pdAo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9jb25vci9saW51eC5naXQvY29tbWl0Lz9pZD0wNGEyMjhhYWRi
ODRkODk0NzIxYjEzMTk3NjQ5Y2E3NDFmMzAxOGJjCj4KPiBEb24ndCB3b3JyeSBhYm91dCBNYXJr
dXMsIG1vc3QgbWFpbnRhaW5lcnMgKG15c2VsZiBpbmNsdWRlZCkgaWdub3JlIGhpcwo+IGNvbW1l
bnRzIG9uIHBhdGNoZXMuIFRoZSBjb21taXQgbWVzc2FnZSBoZXJlIGlzIGZpbmUuCgpXb3VsZCBz
dWNoIGEgcmVzcG9uc2UgbWVhbiBhbHNvIHRoYXQgeW91IGFyZSBvY2Nhc2lvbmFsbHkgaWdub3Jp
bmcgcmVxdWlyZW1lbnRzCmZyb20gYSByZWZlcmVuY2VkIExpbnV4IGRldmVsb3BtZW50IGd1aWRl
bGluZT8KClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
