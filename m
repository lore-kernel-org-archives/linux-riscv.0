Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51C9C87FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmAKLwWiUF7ne5L4v3IFOqH4o6o+BoiNCxPyirEx14Y=; b=PsHZlE2C3svc2N
	PFLE0cOMAW/s0BV7o2n4SRS5hiSxp+1D0wfCAnU7MPjsfVAL/MXYmVBcaZFiQ7q86YEB/b8+App8M
	LbbbNKRQ8gHKCxE40Q7T5hHsBsyUf/cAxZdevAj8o8sdbo9F0ZThvbqOz5HlCVhPMDD9Lji6VJAFb
	ffAxd0vRaMrId/rhRWcvsBHg3XGki4XyZKuQCkrk9vYn9S6FQ5rVCBPiy0dJigzjUhSjf0/kCJHSQ
	KEmgrufsol1rrz3OCAPozXme9H8jDA6gmza3d3NI3Otyhpw23jyXvDV/9GTWk7OcUqhpVCyg+iA1b
	02NmVOKtvrOJzzutuUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedUE-00000005dvo-1RVN;
	Wed, 23 Jul 2025 17:42:38 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedLD-00000005c2g-25tF;
	Wed, 23 Jul 2025 17:33:20 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-558fd84da64so4744e87.2;
        Wed, 23 Jul 2025 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753291998; x=1753896798; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBM3XOa1GXkPG7AU5j/kIOwYcdf4HqHkAm2pQZ3zu3U=;
        b=aeQZH6QYHNKGDaYCTef1n6YVbYU7wt2DgR1BIarAzoa0axuvbRE9VCpKr35CUUyda0
         +xnKktmW/bwr35mU+0pT9SwQMywlNOMwWgzY57Al7eeyxt1WGOs5njYhBGH9+EIJyzy6
         fNXC5A1Vg1JVDcNW6CMmygoCYHeQmaVVk2Z06O61yw9WAG7TzzZS2pof6PBA7XJY2n+N
         yI+MCgr1P4o1BFLNTbeiIzoXEpLAv2CBOwAbUf8bkdCHUGFiBtNfjJmorVvmPsUKboLf
         E+5101rUSGQXCMPvrOW6PL0CPDD0rVXm/y4zJ2DrxqbMMlAVo1PPLY/cL1eevl4iVII5
         LIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753291998; x=1753896798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBM3XOa1GXkPG7AU5j/kIOwYcdf4HqHkAm2pQZ3zu3U=;
        b=h8ujWDyC1ewwbTLBSidDPJzL232J2Q1CqYvCXkxsttYBk5JU34B1G7oz4QIWECQVTE
         oTdvK6rzgHS1yr+nUHATPqDtNI6HmlI+G4Dbp4rZLBT3l99RzjXm8t0B/9sjnqSce9nc
         2dd6KqzeNmF6ppFfU9T1dGgT4/TyXVOcRfPzDzvmbVIKbqTTYbtU/6Fr/zWfSUsQxE5z
         GxNlV5Rme8hxzwWuGly7HgdJmtAR3rftnIt6RM0DlqGxo8sxoGeLGiS0/BvzxocbLnG9
         HxK5LA0vjbewMEloL/sbwTCXwCIuiEfHU3zCSk5ZHo4R+kQ3v+TB/NpfsrH369bTFszB
         dLVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6ZPJ+N8f+s9QCD/eEArQZfxDgNmyevx+MmIKfZ+Y8vdyHREKAILDC/ksL4Nk8HlLUoUzjfNqg+864Lw==@lists.infradead.org, AJvYcCWH8BGTTE0f49lV3Uw7kUSVuOjH5RYD2lBtJZfAxH5i089AfzY/XWWcK3YZLYgdm0kditbs3ZCIHkM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyqGhkIgy4Odpr49Y2nhTxdo2b3XxD6d5s7FaIrREvgrzWOkIn
	avZZIDHtS6arjh3eigg7hBhgfkYuDkK3hHA5KQ/1cxq+yLAWAtdfrHIh
X-Gm-Gg: ASbGncvBYQlS7A2Cj3QPia0mOcKccbDIk6x6OqFMHgEHzm8anCEfYW5diNmo8V3/QXQ
	h5cq89QukHv5rT1z3tJ9wnJApik0xRt8H3uqOG5kc+o8n67D+oTdPCTmEwJIV2J6iWN0CwAnhPY
	wtLkARBKTQz5hyRNx8Dvm4dubAv3tT3aFAwRrELuGQm8o6VeeFiRETTfoQcoeEtKR3I8tC+SBGD
	xs01l22gZPzxp82mR+OOJAMAlsvf4KSTuq+PuK+Etryzr/hYD45FLlEhm4+kgT+XFff5rCbk7jp
	xWWPjsXvkC8UaYCRm37T3gPcKFynnc/qqz7O2hGXr6fSjL20IK46Q8mkFygZP7p9vDFCm7pAb8Q
	4YXZpKmLNIdgwWDxFtqS1LZtD72CPZCWVrCkIf7E=
X-Google-Smtp-Source: AGHT+IEhfKgja72kmMEVu8mg+y0GPA2wBPQGXBF9w7fJkfAZVikcQ8zyKptW1cZk85GIYWtzdxftWQ==
X-Received: by 2002:a05:6512:3c8b:b0:553:24b4:6492 with SMTP id 2adb3069b0e04-55a5132157emr458860e87.5.1753291997236;
        Wed, 23 Jul 2025 10:33:17 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aac980sm2396014e87.74.2025.07.23.10.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 10:33:16 -0700 (PDT)
Message-ID: <f7051d82-559f-420d-a766-6126ba2ed5ab@gmail.com>
Date: Wed, 23 Jul 2025 19:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] kasan: unify kasan_arch_is_ready() and remove
 arch-specific implementations
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com,
 dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
 <CACzwLxjD0oXGGm2dkDdXjX0sxoNC2asQbjigkDWGCn48bitxSw@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CACzwLxjD0oXGGm2dkDdXjX0sxoNC2asQbjigkDWGCn48bitxSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_103319_543957_5ABB1E6B 
X-CRM114-Status: GOOD (  24.65  )
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

CgpPbiA3LzIyLzI1IDg6MjEgUE0sIFNhYnlyemhhbiBUYXNib2xhdG92IHdyb3RlOgo+IE9uIFR1
ZSwgSnVsIDIyLCAyMDI1IGF0IDM6NTnigK9BTSBBbmRyZXkgUnlhYmluaW4gPHJ5YWJpbmluLmEu
YUBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiA3LzE3LzI1IDQ6MjcgUE0sIFNhYnly
emhhbiBUYXNib2xhdG92IHdyb3RlOgo+Pgo+Pj4gPT09IFRlc3Rpbmcgd2l0aCBwYXRjaGVzCj4+
Pgo+Pj4gVGVzdGluZyBpbiB2MzoKPj4+Cj4+PiAtIENvbXBpbGVkIGV2ZXJ5IGFmZmVjdGVkIGFy
Y2ggd2l0aCBubyBlcnJvcnM6Cj4+Pgo+Pj4gJCBtYWtlIENDPWNsYW5nIExEPWxkLmxsZCBBUj1s
bHZtLWFyIE5NPWxsdm0tbm0gU1RSSVA9bGx2bS1zdHJpcCBcCj4+PiAgICAgICBPQkpDT1BZPWxs
dm0tb2JqY29weSBPQkpEVU1QPWxsdm0tb2JqZHVtcCBSRUFERUxGPWxsdm0tcmVhZGVsZiBcCj4+
PiAgICAgICBIT1NUQ0M9Y2xhbmcgSE9TVENYWD1jbGFuZysrIEhPU1RBUj1sbHZtLWFyIEhPU1RM
RD1sZC5sbGQgXAo+Pj4gICAgICAgQVJDSD0kQVJDSAo+Pj4KPj4+ICQgY2xhbmcgLS12ZXJzaW9u
Cj4+PiBDbGFuZ0J1aWx0TGludXggY2xhbmcgdmVyc2lvbiAxOS4xLjQKPj4+IFRhcmdldDogeDg2
XzY0LXVua25vd24tbGludXgtZ251Cj4+PiBUaHJlYWQgbW9kZWw6IHBvc2l4Cj4+Pgo+Pj4gLSBt
YWtlIEFSQ0g9dW0gcHJvZHVjZXMgdGhlIHdhcm5pbmcgZHVyaW5nIGNvbXBpbGluZzoKPj4+ICAg
ICAgIE1PRFBPU1QgTW9kdWxlLnN5bXZlcnMKPj4+ICAgICAgIFdBUk5JTkc6IG1vZHBvc3Q6IHZt
bGludXg6IHNlY3Rpb24gbWlzbWF0Y2ggaW4gcmVmZXJlbmNlOiBcCj4+PiAgICAgICAgICAgICAg
IGthc2FuX2luaXQrMHg0MyAoc2VjdGlvbjogLmx0ZXh0KSAtPiBcCj4+PiAgICAgICAgICAgICAg
IGthc2FuX2luaXRfZ2VuZXJpYyAoc2VjdGlvbjogLmluaXQudGV4dCkKPj4+Cj4+PiBBRkFJVSwg
aXQncyBkdWUgdG8gdGhlIGNvZGUgaW4gYXJjaC91bS9rZXJuZWwvbWVtLmMsIHdoZXJlIGthc2Fu
X2luaXQoKQo+Pj4gaXMgcGxhY2VkIGluIG93biBzZWN0aW9uICIua2FzYW5faW5pdCIsIHdoaWNo
IGNhbGxzIGthc2FuX2luaXRfZ2VuZXJpYygpCj4+PiB3aGljaCBpcyBtYXJrZWQgd2l0aCAiX19p
bml0Ii4KPj4+Cj4+PiAtIEJvb3RpbmcgdmlhIHFlbXUtc3lzdGVtLSBhbmQgcnVubmluZyBLVW5p
dCB0ZXN0czoKPj4+Cj4+PiAqIGFybTY0ICAoR0VORVJJQywgSFdfVEFHUywgU1dfVEFHUyk6IG5v
IHJlZ3Jlc3Npb24sIHNhbWUgYWJvdmUgcmVzdWx0cy4KPj4+ICogeDg2XzY0IChHRU5FUklDKTog
bm8gcmVncmVzc2lvbiwgbm8gZXJyb3JzCj4+Pgo+Pgo+PiBJdCB3b3VsZCBiZSBpbnRlcmVzdGlu
ZyB0byBzZWUgd2hldGhlciBBUkNIX0RFRkVSX0tBU0FOPXkgYXJjaGVzIHdvcmsuCj4+IFRoZXNl
IHNlcmllcyBhZGQgc3RhdGljIGtleSBpbnRvIF9fYXNhbl9sb2FkKigpL19zdG9yZSooKSB3aGlj
aCBhcmUgY2FsbGVkCj4+IGZyb20gZXZlcnl3aGVyZSwgaW5jbHVkaW5nIHRoZSBjb2RlIHBhdGNo
aW5nIHN0YXRpYyBicmFuY2hlcyBkdXJpbmcgdGhlIHN3aXRjaC4KPj4KPj4gSSBoYXZlIHN1c3Bp
Y2lvbiB0aGF0IHRoZSBjb2RlIHBhdGNoaW5nIHN0YXRpYyBicmFuY2hlcyBkdXJpbmcgc3RhdGlj
IGtleSBzd2l0Y2gKPj4gbWlnaHQgbm90IGJlIHByZXBhcmVkIHRvIHRoZSBmYWN0IHRoZSBjdXJy
ZW50IENQVSBtaWdodCB0cnkgdG8gZXhlY3V0ZSB0aGlzIHN0YXRpYwo+PiBicmFuY2ggaW4gdGhl
IG1pZGRsZSBvZiBzd2l0Y2guCj4gCj4gQUZBSVUsIHlvdSdyZSByZWZlcnJpbmcgdG8gdGhpcyBm
dW5jdGlvbiBpbiBtbS9rYXNhbi9nZW5lcmljLmM6Cj4gCj4gc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSBib29sIGNoZWNrX3JlZ2lvbl9pbmxpbmUoY29uc3Qgdm9pZCAqYWRkciwKPiAKPiAgICAgICBz
aXplX3Qgc2l6ZSwgYm9vbCB3cml0ZSwKPiAKPiAgICAgICB1bnNpZ25lZCBsb25nIHJldF9pcCkK
PiB7Cj4gICAgICAgICBpZiAoIWthc2FuX3NoYWRvd19pbml0aWFsaXplZCgpKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsKPiAuLi4KPiB9Cj4gCj4gYW5kIHBhcnRpY3VsYXJseSwgdG8g
YXJjaGl0ZWN0dXJlcyB0aGF0IHNlbGVjdHMgQVJDSF9ERUZFUl9LQVNBTj15LCB3aGljaCBhcmUK
PiBsb29uZ2FyY2gsIHBvd2VycGMsIHVtLiBTbyB3aGVuIHRoZXNlIGFyY2ggdHJ5IHRvIGVuYWJs
ZSB0aGUgc3RhdGljIGtleToKPiAKPiAxLiBzdGF0aWNfYnJhbmNoX2VuYWJsZSgma2FzYW5fZmxh
Z19lbmFibGVkKSBjYWxsZWQKPiAyLiBLZXJuZWwgcGF0Y2hlcyBjb2RlIC0gY2hhbmdlcyBqdW1w
IGluc3RydWN0aW9ucwo+IDMuIENvZGUgcGF0Y2hpbmcgaW52b2x2ZXMgbWVtb3J5IHdyaXRlcwo+
IDQuIE1lbW9yeSB3cml0ZXMgY2FuIHRyaWdnZXIgYW55IEtBU0FOIHdyYXBwZXIgZnVuY3Rpb24K
PiA1LiBXcmFwcGVyIGNhbGxzIGthc2FuX3NoYWRvd19pbml0aWFsaXplZCgpCj4gNi4ga2FzYW5f
c2hhZG93X2luaXRpYWxpemVkKCkgY2FsbHMgc3RhdGljX2JyYW5jaF9saWtlbHkoJmthc2FuX2Zs
YWdfZW5hYmxlZCkKPiA3LiBUaGlzIHJlYWRzIHRoZSBzdGF0aWMga2V5IGJlaW5nIHBhdGNoZWQg
LS0tIHRoaXMgaXMgdGhlIHBvdGVudGlhbCBpc3N1ZT8KPiAKCgpZZXMsIHRoYXQncyByaWdodC4K
Cgo+IFRoZSBjdXJyZW50IHJ1bnRpbWUgY2hlY2sgaXMgZm9sbG93aW5nIGluIHRpcyB2MyBwYXRj
aCBzZXJpZXM6Cj4gCj4gI2lmZGVmIENPTkZJR19BUkNIX0RFRkVSX0tBU0FOCj4gLi4uCj4gc3Rh
dGljIF9fYWx3YXlzX2lubGluZSBib29sIGthc2FuX3NoYWRvd19pbml0aWFsaXplZCh2b2lkKQo+
IHsKPiAgICAgICAgIHJldHVybiBzdGF0aWNfYnJhbmNoX2xpa2VseSgma2FzYW5fZmxhZ19lbmFi
bGVkKTsKPiB9Cj4gLi4uCj4gI2VuZGlmCj4gCj4gSSB3b25kZXIsIGlmIEkgc2hvdWxkIGFkZCBz
b21lIHByb3RlY3Rpb24gb25seSBmb3IgS0FTQU5fR0VORVJJQywKPiB3aGVyZSBjaGVja19yZWdp
b25faW5saW5lKCkgaXMgY2FsbGVkIChvciBmb3IgYWxsIEtBU0FOIG1vZGVzPyk6Cj4gCj4gI2lm
ZGVmIENPTkZJR19BUkNIX0RFRkVSX0tBU0FOCj4gLi4uCj4gc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSBib29sIGthc2FuX3NoYWRvd19pbml0aWFsaXplZCh2b2lkKQo+IHsKPiAgICAgICAgIC8qIEF2
b2lkIHJlY3Vyc2lvbiAoPykgZHVyaW5nIHN0YXRpYyBrZXkgcGF0Y2hpbmcgKi8KPiAgICAgICAg
IGlmIChzdGF0aWNfa2V5X2NvdW50KCZrYXNhbl9mbGFnX2VuYWJsZWQua2V5KSA8IDApCj4gICAg
ICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgICAgICAgIHJldHVybiBzdGF0aWNfYnJhbmNo
X2xpa2VseSgma2FzYW5fZmxhZ19lbmFibGVkKTsKPiB9Cj4gLi4uCj4gI2VuZGlmCj4gCj4gUGxl
YXNlIHN1Z2dlc3Qgd2hlcmUgdGhlIGlzc3VlIGlzIGFuZCBpZiBJIHVuZGVyc3Rvb2QgdGhlIHBy
b2JsZW0uCgpJIGRvbid0IGtub3cgaWYgaXQncyBhIHJlYWwgcHJvYmxlbSBvciBub3QuIEknbSBq
dXN0IHBvaW50aW5nIG91dCB0aGF0IHdlIG1pZ2h0CmhhdmUgdHJpY2t5IHVzZSBjYXNlIGhlcmUg
YW5kIG1heWJlIHRoYXQncyBhIHByb2JsZW0sIGJlY2F1c2Ugbm9ib2R5IGhhZCBzdWNoIHVzZQpj
YXNlIGluIG1pbmQuIEJ1dCBtYXliZSBpdCdzIGp1c3QgZmluZS4KSSB0aGluayB3ZSBqdXN0IG5l
ZWQgdG8gYm9vdCB0ZXN0IGl0LCB0byBzZWUgaWYgdGhpcyB3b3Jrcy4KCj4gSSBtaWdodCB0cnkg
dG8gcnVuIFFFTVUgb24gcG93ZXJwYyB3aXRoIEtVbml0cyB0byBzZWUgaWYgSSBzZWUgYW55IGxv
Z3MuCnBvd2VycGMgdXNlZCBzdGF0aWMga2V5IHNhbWUgd2F5IGJlZm9yZSB5b3VyIHBhdGNoZXMs
IHNvIHBvd2VycGMgc2hvdWxkIGJlIGZpbmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
