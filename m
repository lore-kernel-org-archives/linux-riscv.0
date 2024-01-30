Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C652C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YADDCNHT8bemerwnFJ5M8QI6Yj9N4CPklxTnwaa/vGw=; b=PC/4eTBkSp+ABD
	vAW3Xkaz4tJsjMKT/S0FVH3X+RZ+ljCYAPMXmZPRgOTdQWwVLS+fVYuk1oryyYy2FFdN8I4HUzuQY
	tIp4wkqNmDNpEb7OTYSH0zX+PcY4e6FtFFd7sBh3FtihiVuMnlN+m7+SiajcnBTaUW8O5TMeW0UNf
	pjX3jNTIyTKjhBF8xyus/+arEBIQ2BDEnSjh7HqUImsftqnDzFp8JzRCWdS1cndKalnck/cP329Zn
	TecYobsPOli/Ipz4a+n1Y6f4uVZHr4FMQFbVqoXqGdullmj2yDajzCQzdRCVGggPGeQu2OxmHOwpZ
	PKPgoDxkUYhn/nKeJu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUnyM-0000000GowQ-2X2L;
	Tue, 30 Jan 2024 13:16:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUnyK-0000000GovC-2K0K
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 13:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15D4460BC8
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 13:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E645C433A6
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706620575;
	bh=jRzjCLDb/0atRPzlAVeh/A8UabCjn3/OUg4jCrnn7pM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OLBa0zWqeww5EZFBUoHSQG3EYCDTvpY+GAFjJQfEhGRzh3rB4Y+uRUwXs+rPTrk+v
	 ELtTaMQIOQcTSFy2ZEVZUW8R0wWfXNbr8SrgMmRSjA0uQ8jwDvbVMz8cxUGXswa1ik
	 ZAsflnQwy6D/0IxLGywnicsxOIyz4lrRvl6ph8abTFlFusDeqRhOaS05aRl1hetFvT
	 x9kK5t4aQ6Pxdt4FW6DETaiaRb0YngNocs3sGQKBzcC4TFXCiTJui3FMXUToH4/Ogr
	 lpWJcnHzWAHUWED1jxrtSXUhDEWZO0G5ORvzGo9Ql5yA+h/xFxgr1IU+89w3CvRLh7
	 11KuvXll/fzDg==
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e132fef7baso785399a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 05:16:15 -0800 (PST)
X-Gm-Message-State: AOJu0YyMUHGn41zM4CBH7QMMue/nNIn4mj3enD6Ik4os0OaUOg349gpE
	SDy57z1dyN3A9pKgGO3wTESWnuPu4IsxrlwiCr9ezsAZiQSbaGscFmu5CsyZ2CfkohlmtJwjCl0
	FT+2M+PIM0j+aShjdqrjeSWFOsp8=
X-Google-Smtp-Source: AGHT+IH0QKKzJW8xp+4nnQDbAa1mwu9E2R4b/6ilaCz62C2DDiOxDRG8B3m8HReXobVLIV7LvELXlNZY67ilVEKMsDA=
X-Received: by 2002:a05:6870:b90a:b0:214:c782:8acd with SMTP id
 gx10-20020a056870b90a00b00214c7828acdmr6716987oab.8.1706620575029; Tue, 30
 Jan 2024 05:16:15 -0800 (PST)
MIME-Version: 1.0
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
 <20240129-unripe-pleading-d2753b766e88@spud>
In-Reply-To: <20240129-unripe-pleading-d2753b766e88@spud>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 30 Jan 2024 22:15:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-sKNf9mCxZakeW_zzXiRYxbTaLqC7Z-+M7xYVMRw55Q@mail.gmail.com>
Message-ID: <CAK7LNAT-sKNf9mCxZakeW_zzXiRYxbTaLqC7Z-+M7xYVMRw55Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of
 tree LLVM
To: Conor Dooley <conor@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, nicolas@fjasle.eu, andy.chiu@sifive.com, 
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_051616_722237_77BC7F6F 
X-CRM114-Status: GOOD (  21.57  )
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

T24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMTozNOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEphbiAyNSwgMjAyNCBhdCAxMDozMjoxMEFNIC0w
NzAwLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+IEhpIGFsbCwKPiA+Cj4gPiBFcmljIHJl
cG9ydGVkIHRoYXQgYnVpbGRzIG9mIExMVk0gd2l0aCBbMV0gKGNsb3NlIHRvIHRpcCBvZiB0cmVl
KSBoYXZlCj4gPiBDT05GSUdfQVNfSEFTX09QVElPTl9BUkNIPW4gYmVjYXVzZSB0aGUgdGVzdCBm
b3IgZXhwZWN0ZWQgZmFpbHVyZSBvbgo+ID4gaW52YWxpZCBpbnB1dCBoYXMgc3RhcnRlZCBzdWNj
ZWVkaW5nLgo+ID4KPiA+IFRoaXMgS2NvbmZpZyB0ZXN0IHdhcyBhZGRlZCBiZWNhdXNlICcub3B0
aW9uIGFyY2gnIG9ubHkgY2F1c2VzIGFuCj4gPiBhc3NlbWJsZXIgd2FybmluZyB3aGVuIGl0IGlz
IHVuc3VwcG9ydGVkLCByYXRoZXIgdGhhbiBhIGhhcmQgZXJyb3IsCj4gPiB3aGljaCBpcyB3aGF0
IHVzZXJzIG9mIGFzLWluc3RyIGV4cGVjdCB3aGVuIHNvbWV0aGluZyBpcyB1bnN1cHBvcnRlZC4K
PiA+Cj4gPiBUaGlzIGNhbiBiZSByZXNvbHZlZCBieSB0dXJuaW5nIGFzc2VtYmxlciB3YXJuaW5n
cyBpbnRvIGVycm9ycyB3aXRoCj4gPiAnLVdhLC0tZmF0YWwtd2FybmluZ3MnIGxpa2Ugd2UgZG8g
d2l0aCB0aGUgY29tcGlsZXIgd2l0aCAnLVdlcnJvcicsCj4gPiB3aGljaCBpcyB3aGF0IHRoZSBm
aXJzdCBwYXRjaCBkb2VzLiBUaGUgc2Vjb25kIHBhdGNoIHJlbW92ZXMgdGhlIGludmFsaWQKPiA+
IHRlc3QsIGFzIHRoZSB2YWxpZCB0ZXN0IGlzIGdvb2QgZW5vdWdoIHdpdGggZmF0YWwgd2Fybmlu
Z3MuCj4gPgo+ID4gSSBoYXZlIGRpZmZlZCBzZXZlcmFsIGNvbmZpZ3VyYXRpb25zIGZvciB0aGUg
ZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMKPiA+IHRoYXQgdXNlIGFzLWluc3RyIGFuZCBJIGhhdmUg
Zm91bmQgbm8gaXNzdWVzLgo+ID4KPiA+IEkgdGhpbmsgdGhpcyBjb3VsZCBnbyBpbiB0aHJvdWdo
IGVpdGhlciB0aGUga2J1aWxkIG9yIFJJU0MtViB0cmVlIHdpdGgKPiA+IHN1ZmZpY2llbnQgYWNr
cyBidXQgSSB3aWxsIGxldCB0aGVtIGZpZ2h0IG92ZXIgd2hvIHRha2VzIGl0IDopCj4KPiBJIHRo
aW5rIFJJU0MtViB3b3VsZCBiZSBnb29kLCBzaW5jZSBidWlsZGluZyB0aGUgdmVjdG9yIGNyeXB0
byBzdHVmZgo+IGFsc28gbmVlZHMgdGhpcyBmaXguCgoKT0ssIHRoZW4gSSB3aWxsIGdpdmUgYWNr
IGluc3RlYWQgb2YgYXBwbHlpbmcgdGhpcyBzZXJpZXMuCgoKQWNrZWQtYnk6IE1hc2FoaXJvIFlh
bWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+CgoKCgoKCj4gVGVzdGVkLWJ5OiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IFJldmlld2VkLWJ5OiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKCgoKCgoKCgotLSAKQmVzdCBSZWdhcmRz
Ck1hc2FoaXJvIFlhbWFkYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
