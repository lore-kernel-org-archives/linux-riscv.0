Return-Path: <SRS0=EHGE=NX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A2EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 08:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC60B216FD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 08:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pLfLA3IX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmCr9lPe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC60B216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPPl//IQl2jPWAnRmrjHVXrZWNVvS5bNNBOEde3zExM=; b=pLfLA3IXDxTnPR
	H7st7lADmK2QlLT7eYSxUdhVPXXGUxpx3jsMZ9I/cL6h4oo121MyNTL7hcklWgdLYDAua+5zlBCuf
	+WqAPJdJVVWoB9JCtdX/GYIIRkspME8Ou6gSnmdYvwEeqTrNkXaWcWmkJcuaIP3cnPykhi+PRyzSe
	220T/oZMQZApq69x4nyO9heX2ccweg01MOOZnOEEyEUT5ajSoO69wArDKI3nsfOdokjxC/xeO4/oZ
	3WH8nn4DRHygYZd9J/9LXQ8j36syGfirtqiElD1jtrtsAojO5uAU2ooTvtVLwUY1So5fR0pJtuoF5
	7fvBZVoTQM/OB38L+o9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gM7bz-0005br-R5; Mon, 12 Nov 2018 08:30:23 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM7bc-00059a-Dl
 for linux-riscv@lists.infradead.org; Mon, 12 Nov 2018 08:30:02 +0000
Received: by mail-it1-x144.google.com with SMTP id r12-v6so11429368ita.3
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 00:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vWwgY24tNZCmJOla7YZMR1NXSyj4vVK1UI+xPsr+gdI=;
 b=fmCr9lPebYBgYwuy1FyJfU8E4Hcwk0Ky83FtvvWlAOHptc26nOfVGRmE0//yJZ6iat
 tNf3+syo0nr8UZVd6fADJwNGiF4ZI1bKzq8EeAsH1UWf/WRyZ82Ic1IbNY16EMr8M3XW
 LU2Z/AgKdwT5iGon/Ok1EVKJgitK+Ud2g3G25aRYof2MYkHvXir6ror9p7vvvPoQ6Xtk
 2J/ALQCa9ngCWx5DREU2RNXBiYG1NR7ZQVXRLvi5lVU4lAbmMdVdhqwZNkwxVlJ/voXi
 QXimZGMBen2PJdC7KjlH9Nm5yRFys97yr4WKbCywvXM/gRGk7lsEbWdxWXs/A4UlMdmj
 5hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vWwgY24tNZCmJOla7YZMR1NXSyj4vVK1UI+xPsr+gdI=;
 b=VnZXUCb33N2Y6XATpuQUCdao0wkT1LJj1103mr/4DGe1cmLGJbpTeY4/Xldu8RMQT0
 BWkApjRk7oCdrfcoMLtNvf15N3UYes7f5E41va3Q81qBk7XT/eykBX4o5Elmbtyj3FYB
 0EnOfN9xBnsWd8HNvlInTNnO7vGH5XrbG7xw8OpQP62smkQBBMWzqQiGrIxF2rtcuCDW
 y35YTgAw+Ck6kfwl68UZBo3uVj7rGneNlpcFmgSpy5kbMiUIfcxr8eXi+xQ+vALFNjez
 zjrRj+KrdCFM4PddSjq8bN+gVbSlU/qAjnzeXDHKEb1uew1nClYd9u0R/wKjt42NrnIv
 9fTA==
X-Gm-Message-State: AGRZ1gLo6ksCk7fFzh5Dk9eeWHSyshv0OcdO5WLbjxOlfQHgpYVFIzty
 xS1J3qgVkSkw5W66An8N4lCflOwJVHjfAJQ/mgk=
X-Google-Smtp-Source: AJdET5dHXRV9SYyOgZmzgAPq4r7rjt81X3FpXad+g87yG4jooczDeUXZ++E4T2t+RJF8vzYu0xancG2GcRP1Tew9iko=
X-Received: by 2002:a24:1458:: with SMTP id 85-v6mr9748709itg.40.1542011368945; 
 Mon, 12 Nov 2018 00:29:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1541995312.git.zongbox@gmail.com>
 <41e8cb18d321244ab7000f7dc0467b6ebc5cab8f.1541995312.git.zongbox@gmail.com>
 <CAEn-LTpXnzSG-rVVvv_2cbxqY2vTchOKn6M0isRBovoq4jpZGw@mail.gmail.com>
In-Reply-To: <CAEn-LTpXnzSG-rVVvv_2cbxqY2vTchOKn6M0isRBovoq4jpZGw@mail.gmail.com>
From: Zong Li <zongbox@gmail.com>
Date: Mon, 12 Nov 2018 16:29:17 +0800
Message-ID:
 <CA+ZOyahQ-6biJazXCYr539-rCQHuJOz6QFuVB_Jv5EpfYuPrwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Request stat64 on RV32
To: david.abdurachmanov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_003000_464858_6941B990 
X-CRM114-Status: GOOD (  15.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: marcin.juszkiewicz@linaro.org, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zong Li <zong@andestech.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181112082917.1dRWZ-NbYHyyOf_8NenY2-1mElaIZmoMXhzH9vipPOo@z>

RGF2aWQgQWJkdXJhY2htYW5vdiA8ZGF2aWQuYWJkdXJhY2htYW5vdkBnbWFpbC5jb20+IOaWvCAy
MDE45bm0MTHmnIgxMuaXpSDpgLHkuIAg5LiL5Y2IMjoxOeWvq+mBk++8mgo+Cj4gT24gTW9uLCBO
b3YgMTIsIDIwMTggYXQgNToxMCBBTSBab25nIExpIDx6b25nYm94QGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gVGhlIHN0YXQ2NCBmYW1pbHkgdGhhdCBpcyB1c2VkIG9uIDMyLWJpdCBhcmNoaXRl
Y3R1cmVzIHRvIHJlcGxhY2UKPiA+IG5ld3N0YXQuCj4gPgo+ID4gU2luY2UgY29tbWl0IDY3MzE0
ZWM3YjAyNTAyOTBjYzg1ZWFhN2EyZjg4YThkZGI5ZTg1NDcgKCJSSVNDLVY6IFJlcXVlc3QKPiA+
IG5ld3N0YXQgc3lzY2FsbHMiKSwgdGhlIFJWMzIgYnVpbGQgZmFpbCB3aXRoIHVuZGVjbGFyZWQg
J3N5c19mc3RhdGF0NjQnCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZ0BhbmRl
c3RlY2guY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91bmlzdGQuaCB8
IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VuaXN0ZC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS91bmlzdGQuaAo+ID4gaW5kZXggZWZmN2FhOS4uYTRhYWRlOSAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdW5pc3RkLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdW5pc3RkLmgKPiA+IEBAIC0xOCw1ICsxOCw2IEBACj4gPgo+ID4gICNkZWZpbmUg
X19BUkNIX1dBTlRfTkVXX1NUQVQKPiA+ICAjZGVmaW5lIF9fQVJDSF9XQU5UX1NZU19DTE9ORQo+
ID4gKyNkZWZpbmUgX19BUkNIX1dBTlRfU1RBVDY0Cj4gPiAgI2luY2x1ZGUgPHVhcGkvYXNtL3Vu
aXN0ZC5oPgo+ID4gICNpbmNsdWRlIDx1YXBpL2FzbS9zeXNjYWxscy5oPgo+ID4gLS0KPgo+IFNl
ZTogaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LXJpc2N2LzIwMTgt
Tm92ZW1iZXIvMDAyMDg3Lmh0bWwKPgo+IFRoZSBwbGFuIGlzIG5vdCB0byBoYXZlIG9sZCBzdGF0
IHN5c2NhbGxzIGFuZCBzdXBwb3J0IHN0YXR4IG9uCj4gcmlzY3YzMiwgd2hpY2ggaXMgeTIwMzgg
c2FmZS4KPgo+IFRoZSBpc3N1ZSB5b3Ugc2VlIGlzIGEgYnVnIGluIGluY2x1ZGUvdWFwaS9hc20t
Z2VuZXJpYy91bmlzdGQuaC4KPiBNYXJjaW4gKENDKSBhbHJlYWR5IHNlbnQgYSBwYXRjaCB0byBB
cm5kIChDQykgSUlSQy4gQmFzaWNhbGx5IHdpdGhvdXQKPiBfX0FSQ0hfV0FOVF9ORVdfU1RBVCBv
ciBfX0FSQ0hfV0FOVF9TVEFUNjQgdHdvIG1hY3JvcyBhcmUgbm90IGRlZmluZWQ6Cj4gX19OUjMy
NjRfZnN0YXRhdCBhbmQgX19OUjMyNjRfZnN0YXQuIFdoaWNoIGlzIGxhdGVyIHVzZWQgKHdpdGhv
dXQgYW55Cj4gZ3VhcmRzKToKPgo+IDc2MyAjZGVmaW5lIF9fTlJfbmV3ZnN0YXRhdCBfX05SMzI2
NF9mc3RhdGF0Cj4gNzY0ICNkZWZpbmUgX19OUl9mc3RhdCBfX05SMzI2NF9mc3RhdAoKTmljZS4g
VGhhbmsgeW91LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
