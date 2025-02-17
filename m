Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2760DC0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 10:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Q3xWhGq0q2/P2Z8DFuGftIbmX7FXmApKlTrQ1rlvo0=; b=1jkbclpKdVPFUN
	iLE85slmbAMsL8knj/r9h/X1X70tkf7WPVEkiBHAk9PzNyyz/YxTv9EMmDnCqSs9+jv8lfRIpPe84
	s7CByQExI0YshqoxkiyjK1jMbBXb2O8z/9EABXfE2Mfn3BBu/RNqs/PSe4eQTArfPnFLoxzlkNMHe
	gkbqQMxHO1Lx0h/CDZUvJcxV2jpEEo8QBIVoWSUXbdfl7UpkzjEXt+ja/imqXKyyau/YoTAKa/Ypc
	UXK1zzk49W3rmeu41D8RlYh8bVaYMfi/4RICkbSopBNnohJZQEG+rO3H3PM1loqf5GF9vPv+I5X4k
	vlZdQqAw1GiwbBNGZzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyoX-00000004EHf-3mcP;
	Mon, 17 Feb 2025 10:57:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyoW-00000004EHH-2wU9
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Feb 2025 10:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vsTtMyTsJbWMVKOlmUKSf/JarHtELa1O22QRRoXh8xk=; b=lL2qa1nWBws7G1ezP4pFS0NJVI
	pQ5Tn27ShjoOgumhmiiefvWfVhFITTArtoqlzrJ+hYL57bQwTBNbl2ABAa0lkSDvsm4vRDHReKRiD
	IcRd71hX55VRdUNa1uP5vP4Sozk2L0+M/w95+o3pLXvUYPbkSO7WBC291ncIOivCz57ouTcbuxKqh
	oFV1lKv6WHNlfj/D1S9YeGuXHjCRW6ZJkgMv70EpmN+k6DUNp0aMsJLC1itLwlnE8fBlGM5twSgUH
	JXPWFM4Wzb74n0oPou8IB5L9CAfcSAgOIRjMAoJLs7xghRLzsVjNrPZahOgcRvE5eggtlvZMrdEfs
	VStRvZXA==;
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyoS-00000001mZw-3c2M
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 10:57:23 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d2223fe5a4so5848365ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 02:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1739789838; x=1740394638; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsTtMyTsJbWMVKOlmUKSf/JarHtELa1O22QRRoXh8xk=;
        b=YzM8uNsZ+1ynOF12/GWkHDJfBAaw4dDcFkPisJCYqW38BVimFLXQurmHu7h75+1mSz
         k0GIDLmj2L82ZMQTG2XAfaUo7UksqPn8Mz8Tc+KODuYw8bzj9J13ij40JQmWVDaVP4Ob
         jvoUmpptLFcTjMe+etVBT1Irley14xSw0Tj0CHuFkDXTe0JV+DchqjSkAhcX97cIHwSU
         yanN/pCwo+l/zuHNw82uOW4nk04RGbOY+gDgeYR1gGi+bi4ZpTrjOYeUpOYFKRwxIZ5E
         5eob8kbPUB9b1VUcoae8KucUhRI9RLIysMEmZcImnO/RbKUvV+6yoF6HEaNaDyQjKt43
         957g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789838; x=1740394638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsTtMyTsJbWMVKOlmUKSf/JarHtELa1O22QRRoXh8xk=;
        b=dibEs7P62K2VRkRYD9DMEN+E0dXHxgWaHFIXTAKyLwq7qtuBpY5EBlZQgE6bWm2BwN
         +O033gOu1s2n83M0kTnlik65Bd2y0qknlbRnjE9+I2IEd1hm81mrFnQVfxDBxC1UmxNz
         XjLURXIjIz3ueDtRkDBYzgvJCtQUhut435WZkz7PLkmY/zrcNoazmj+Y1j/fhd7miZyo
         IXsyjb1QTbEhMJ80Sjdkf6CgzFq6IQu1D5i6aJ5J/85Xx9Cy1gqJ3xpa9Klz2wat3MvQ
         r2oYv9ombrPNDK2fh6TAdS8IMZkQlQKSlgq5Y8GqTVVFw3qDWQVHSV7IC2ZtRrwwYUY2
         +lTg==
X-Forwarded-Encrypted: i=1; AJvYcCWc0S04Ox4FX1Q6EtCp4sE8JnXBcEKEz/9NkD5Em4FCja/NLcstrWOiqiQOBk2nkuUEzEpM5MdauH24Ww==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKu6nk7Ns5Mf4SxLdkiRwzWEh1Eui0SzthOhf9XUYIlFPHxiSk
	9ZUN948O8hxPAAvjOQYZyLmIAT1jn0xKbvTggBpv9kAZQxJBw2JZi61EZOGsnL7Ucxx6gS0UXCL
	cFgbMXWuJ0OmiT2C1FaOKdD90T4LZjR5+ehzD7A==
X-Gm-Gg: ASbGncsGE6JYUd4BSY3ApkRz0q4Ja3TQov11tSx0MpFz2jbQyO2+5sTKc8u4GTcpXsX
	j9zGSqhJU8qd6vHBf+jCV/8Zrms/hmYbEqFMGoa+7TX4JBohFaQmAan4GiH1inwv4IC243hDswg
	==
X-Google-Smtp-Source: AGHT+IF4wt3+bCr8smM4abSpg9jynt5wH6JghaDNkG3zGRYN1zSsdl+CZBbn8XESByuGwGBk4yMvzbUqkz5buCnYAwM=
X-Received: by 2002:a05:6e02:20cf:b0:3d1:a3d0:d064 with SMTP id
 e9e14a558f8ab-3d281755de7mr70090045ab.0.1739789837889; Mon, 17 Feb 2025
 02:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20250217084506.18763-7-ajones@ventanamicro.com> <20250217084506.18763-12-ajones@ventanamicro.com>
In-Reply-To: <20250217084506.18763-12-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Feb 2025 16:27:07 +0530
X-Gm-Features: AWEUYZlXyegh4HuBYLBwZJ9Tly4L0bQenOk0JsQZ_Py81_lO9EAqEQBtXwOwjmo
Message-ID: <CAAhSdy23nJq4Uj9amQ9T4iXtNoCSFLnOjjyp7pm6KdNbH7xkmA@mail.gmail.com>
Subject: Re: [PATCH 5/5] riscv: KVM: Fix SBI sleep_type use
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_105721_155086_0B4A4B6E 
X-CRM114-Status: GOOD (  14.91  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMjoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIHNwZWMgc2F5cyBzbGVlcF90eXBlIGlzIDMy
IGJpdHMgd2lkZSBhbmQgIkluIGNhc2UgdGhlIGRhdGEgaXMKPiBkZWZpbmVkIGFzIDMyYml0IHdp
ZGUsIGhpZ2hlciBwcml2aWxlZ2Ugc29mdHdhcmUgbXVzdCBlbnN1cmUgdGhhdCBpdAo+IG9ubHkg
dXNlcyAzMiBiaXQgZGF0YS4iIE1hc2sgb2ZmIHVwcGVyIGJpdHMgb2Ygc2xlZXBfdHlwZSBiZWZv
cmUKPiB1c2luZyBpdC4KPgo+IEZpeGVzOiAwMjNjMTUxNTFmYmIgKCJSSVNDLVY6IEtWTTogQWRk
IFNCSSBzeXN0ZW0gc3VzcGVuZCBzdXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfc3lzdGVtLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdV9zYmlfc3lzdGVtLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zeXN0ZW0uYwo+
IGluZGV4IDVkNTVlMDg3OTFmYS4uYmMwZWJiYTg5MDAzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpX3N5c3RlbS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
c3lzdGVtLmMKPiBAQCAtNCw2ICs0LDcgQEAKPiAgICovCj4KPiAgI2luY2x1ZGUgPGxpbnV4L2t2
bV9ob3N0Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC93b3JkcGFydC5oPgo+Cj4gICNpbmNsdWRlIDxh
c20va3ZtX3ZjcHVfc2JpLmg+Cj4gICNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gQEAgLTE5LDcgKzIw
LDcgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9zdXNwX2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+Cj4gICAgICAgICBzd2l0Y2ggKGZ1bmNpZCkg
ewo+ICAgICAgICAgY2FzZSBTQklfRVhUX1NVU1BfU1lTVEVNX1NVU1BFTkQ6Cj4gLSAgICAgICAg
ICAgICAgIGlmIChjcC0+YTAgIT0gU0JJX1NVU1BfU0xFRVBfVFlQRV9TVVNQRU5EX1RPX1JBTSkg
ewo+ICsgICAgICAgICAgICAgICBpZiAobG93ZXJfMzJfYml0cyhjcC0+YTApICE9IFNCSV9TVVNQ
X1NMRUVQX1RZUEVfU1VTUEVORF9UT19SQU0pIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgICAgICAgICB9Cj4gLS0KPiAyLjQ4LjEKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
