Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27060CD3427
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 12:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHRXjyOwtZ4Otvf1GvAOAFYnOrzZ3yuGzmUD6TH2ziY=; b=soP5XSFtr7Hai+
	t8u9i+6DfLBsyPLTDYXi1/FT+M1cOfOSrD/sdcaS3lFXru4r1DFcZcjhTWXL/UjLBZ8I4fNutAcMg
	fiZvP9HbmK7DrkNnvlaDZ7/Y9XKZZHa+QGkbWOQgHqBci69TUepH/ugTtd86egV3wUBIPXpkNBupA
	eVYrNvqFrHiGjoFuAriDGh5VZdiwC4DtBrQkxjPJWANKfy+5n9FDHOHvidilAm8n0AwIanr/6BLAE
	4DbU64JSBNlxC3IgdVXyhWszfxNirFvsyGQBoqfO8mwYtPVXnHw1CVwJ1qNQwpaf4nShnJI9+1eZL
	1YaPpVy7Y3u7WxZichkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxQ4-00000003jHy-0v1v;
	Thu, 07 May 2026 12:01:32 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxQ1-00000003jHR-227W
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 12:01:30 +0000
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6948fb494a0so397152eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 05:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778155288; cv=none;
        d=google.com; s=arc-20240605;
        b=hvVlXHCua555Fbw2om+zyhZvK4uGH3OadPmt6c/k4KssJxWBWfVqeu+lyL8WC3rM1a
         1q2QIqYI236MaGKM/XEany5Pzp6EQ2vBsdGm0luFSaHyTAdeDmwLCmKDGRldNr+dQL9M
         VuQnV4CHZtXKotLN0r+fn1VZzaxuMFwry9CDuuTgTTBY7+RPRIAz8YQHvRevwt9RfEld
         /DVkJo5z4glTfWuv+Wfg3jdeT8LuIi6/jlwGKbQXmRH7wwTxg3Iz16q5r9E4mET9Xhhx
         eI7WQA9b9SHqDGC6WJvDGjDerg6BYA8rWnUnXjLDcYnwnnPJLQ7rF26n+hHyEy+EmHNp
         +i4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YnaYJ8w6kd34yqFksm5B7jTO172I6eMzgrwpvE9MTNs=;
        fh=9d8XbLImRe9qH5R08CDCRecxomx1Fn79epjUYBFWPFM=;
        b=GsSzfyUg2rcmvq2R6JyBJnZgGFXKlRrhmOHTDJhLOrnZCrmpy23PK3fC/9lqCXoKnX
         wCTHXyJ7Emf03Sq8Y2kCyu8iBoB2KhKFWlS3Fg/qWPWku+Wagm20al/A2PgG6QhWw440
         64rSi4Pj6x54uk/bC2FjirUhH8IViV/Qg2V/e/4mtTqtUSQZlCi0YadhNHeD+XYyzN+b
         I75rXMjV8tfXkT4E5r1nxuQyphGR9PhysyvyBAhia/dAwUW8jtyBehwEWG5+CfeGHixK
         pg4qtS5H5rHvQrmdlJYEcPqOtxNDQ028Cb+b72xOfpmPOeNGtjzpPfWsTV5w74gdd2YY
         SkSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778155288; x=1778760088; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnaYJ8w6kd34yqFksm5B7jTO172I6eMzgrwpvE9MTNs=;
        b=qcu0EUXd7aVzYi9WVlFQUXmW0tRQiqmRLmHTpgcGd53KwMqWziprsLz3Aa7IZzJ912
         nXHoNFwZwKcwCfAZ6nb9g1KjSoCuQbOpkkOoeFfUkBkmBd3f5Ubx8cUmOcqxw3Y6HOmJ
         YZFp1Sc4xqbf593Bt+OV11NCX/7q4miuuv5VnFWolKZBjiVTUvs18vIkVOcOTpjWTtAS
         8DnUnXYkMRUvbWGMq2rNdHvKhNUBS9eWT2B3xHVa98Jfhbgyhesg31Uqk+PAqwudhl3x
         K4Apeu0sA1bpc81zCru7Q+oRKT/V4vywg0Y33TGmIpBxUvzkra2hweQ7JmtUBJ6UR1at
         C0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155288; x=1778760088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YnaYJ8w6kd34yqFksm5B7jTO172I6eMzgrwpvE9MTNs=;
        b=Ux6VgX9tMv6MkvZ1vevjz+3xtfn65rvtHvUZZms2iqzLIg3Fa3+6nbPr52GEuIiYhz
         B3YvO8JJ8NOa9JN0aVa6TfUmQd67hOl0GOG6m+tbqImQyPUaRYHlr7toxNjeOmmza41w
         ZXd/EOwRHvzxb+9GeVkiuA+u6NNgg7c9FKJ5IC/IOG9+pT7e1WpETlTr3lEONZQHRuTt
         9pBuRU7YHq0dZXMJxaPRuSvRVGqXaGyu+07+FrzE4cRpwK96aSQ+nMRVbvIgd+Ycxg0x
         uDwdeaFMdNmB2NwbBh43Me3fFqc/mELLxBOvyejU4o8FA0xo8hTF93pJ3FMG3d2qUVJW
         ZdGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ivcKAJJgKmXoEPiVoez9nVXdgWFW9Bm5IacUKzL9Tj3iRac6zg8SEsJIYOR3JtDY+VRiuXvqdqPz1zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOv42GNzpf0Mp1/R1w9/EMOxdXrGNyOXgi65KbONXHvcj4jNSC
	h92q1bPM5WlmX1sQXYGrUvFlc5SQeTdCj6iKVMckdUQ83COQ7Hd8ARe8HgtMkXqT2YjcolSFj0M
	vOhWIDDzf1mLiIz+Qces3XMVrdsF/1u+FTlKUZDPWfQ==
X-Gm-Gg: AeBDievouB2nT6wA/iiCZjmCok85u7NxoUuGE4t9nDME/qwuiGZ7yPw3cz+yM0K+SDT
	isxojI02lYyAnpLzuFOp8Mi6ZPQvMefzgPPKPNcTxogIUXHf5wGUlh9D+FJ5wvD6Zfea01t0Md/
	0eVqeMNqsg4j8Ctza9MMza9w5Pur1JDbBbVkzUBbEgEdkpNIVv7VZlWV02xjHvkAArHsjV6ZuAJ
	OYsRX5NW38N1R5QYW4bAnV8GYOougewZqT3XDBhxSik6yhM2syZlcRw6l6hwpjCLOw3Yx4fi9+F
	qYrAqy2b5RNo0WAvpAu2tzpDniar7w5w1a74mTYSCwm4BgUtE2DYa0uD9Ib8sHWACc4qsaI9ZwL
	7lk+igNMi3ZQG2vBI6s+Bcl5gVkqQbAgXmnwvuw==
X-Received: by 2002:a05:6820:4b09:b0:685:2a2d:ccb3 with SMTP id
 006d021491bc7-69998ccaa0emr4080398eaf.20.1778155287744; Thu, 07 May 2026
 05:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260425005916.3321811-1-guoren@kernel.org> <20260425005916.3321811-4-guoren@kernel.org>
 <87wlxhwr8v.ffs@tglx>
In-Reply-To: <87wlxhwr8v.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 7 May 2026 17:31:15 +0530
X-Gm-Features: AVHnY4KEq24Vu_FVNe1O36FY1chK0H9YCsRLUDToEwTAF_X2VUeIt8ykh3nsO4I
Message-ID: <CAAhSdy13JYzqf9mB4zw_NFe1jz9yu3p-JarzUPj7RVK1rmoiMw@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] irqchip/riscv-imsic: Move nr_guest_files to
 per-HART local config
To: Thomas Gleixner <tglx@kernel.org>
Cc: guoren@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, cp0613@linux.alibaba.com, fangyu.yu@linux.alibaba.com, 
	gaohan@iscas.ac.cn, inochiama@gmail.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, me@ziyao.cc, palmer@dabbelt.com, 
	pjw@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_050129_662963_D2BE0DC8 
X-CRM114-Status: GOOD (  11.64  )
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

SGkgVGhvbWFzLAoKT24gV2VkLCBNYXkgNiwgMjAyNiBhdCAxOjQy4oCvQU0gVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgMjUgMjAyNiBhdCAw
MDo1OSwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFi
YSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPgo+ID4gV2l0aCB0aGUgcmVj
ZW50IEtWTSBBSUEgcGVyLUhBUlQgSEdFSSBjb252ZXJzaW9uLCB0aGUgZ2xvYmFsCj4gPiBucl9n
dWVzdF9maWxlcyBpcyBubyBsb25nZXIgYXBwcm9wcmlhdGUuIERpZmZlcmVudCBIQVJUcyBpbgo+
ID4gaGV0ZXJvZ2VuZW91cyBTb0NzIG1heSBoYXZlIGRpZmZlcmVudCBudW1iZXJzIG9mIGd1ZXN0
IGludGVycnVwdAo+ID4gZmlsZXMuCj4gPgo+ID4gTW92ZSBgbnJfZ3Vlc3RfZmlsZXNgIGZyb20g
YHN0cnVjdCBpbXNpY19nbG9iYWxfY29uZmlnYCB0bwo+ID4gYHN0cnVjdCBpbXNpY19sb2NhbF9j
b25maWdgLCBhbmQgY29tcHV0ZSBpdCBwZXItQ1BVIGluCj4gPiBpbXNpY19zZXR1cF9zdGF0ZSgp
IGJhc2VkIG9uIHRoZSBhY3R1YWwgTU1JTyBndWVzdCBmaWxlIHJlZ2lvbiBzaXplLgo+ID4KPiA+
IFVwZGF0ZSB0aGUgcmVsYXRlZCBjb21tZW50IHRvIHJlZmxlY3QgdGhhdCBLVk0gbm93IHVzZXMg
dGhlCj4gPiBwZXItSEFSVCB2YWx1ZS4KPiA+Cj4gPiBUaGlzIGVsaW1pbmF0ZXMgdGhlIGxhc3Qg
Z2xvYmFsIGFzc3VtcHRpb24gYWJvdXQgZ3Vlc3QgZmlsZXMgYW5kCj4gPiBjb21wbGV0ZXMgdGhl
IHBlci1IQVJUIGNvbnZlcnNpb24gc2VyaWVzIGZvciBSSVNDLVYgQUlBL0lNU0lDLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiBBc3N1bWluZyB0aGlzIGdvZXMgdGhyb3VnaCB0aGUgcmlzYy12IHRyZWU6
Cj4KPiBBY2tlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+CgpUaGFua3Ms
IEkgd2lsbCB0YWtlIHRoaXMgc2VyaWVzIHRocm91Z2ggS1ZNIFJJU0MtViB0cmVlLgoKUmVnYXJk
cywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
