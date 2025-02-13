Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A5FC02198
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 01:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YVwqvxIYgnQ1WCG5uLUp8GQ4BTITjafF/11wqvPDZw=; b=i1NYRibVXYoThA
	jRKmagpbHWc4KGPMXqqeoMw9hFhICuoX6OhN5L940vkwNiYQ6rtwoOhiCki1+Kmue8UTmsD4SU6ak
	EOxM7LQdAQ+Z8xqgmK46IZCyPPUefnWorA+14KwERez3p98dUmWd6/s23LKLYaMeqj0K+l9AJIpbo
	4bYwvQPcMxujtTpstGbUzCNbSYMoPgWA8A/mJZE/tyKSl2S7s2MU1bVzIVhC8B2B05WJhgLxTj8IC
	PkEMLM9uyvSk7wpgEsUiWJ78yuF5c0QI4YecR2hJMluSWgQTqgYyHI52sCIdi+2/kgt0SNnzsHYK/
	FT7VFr/9cgmJglUMVldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNvJ-00000009NEE-1QIu;
	Thu, 13 Feb 2025 01:21:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNvH-00000009NDp-0VYT;
	Thu, 13 Feb 2025 01:21:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4395f66a639so2115125e9.0;
        Wed, 12 Feb 2025 17:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739409705; x=1740014505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+nCXvcuGbP6lZuLocKajT0ORe5EGrF6T3/N8VpC8fs=;
        b=bDyWKytAWwbycc1Zq1qqCtj2y+N26a+6g0tzKEPOEiODA3DhP56PqNjQD3tgnsCT5f
         csnFE4/HizpFPZxcqzghMJ500UAYsGedsIQMntiJltUEiQttIFBtXQImLU0adTcd9mkF
         f6Y+QBdYOVjANboq438kyke7zdxgYoxBOo6FgVPevzj9abWNaYEvBhxxYVsjvpAHB9Xc
         BRI7GPTcJGzYPkhw4IsW+QvxrR5MPQiZR/jS+eiRDdzOHpP/LL1UqlP/ydJHN8jLMWUC
         /A7CdYXKq6+DEy+Gq9lFJmPkV5XhZWQXovtcXwbLUBpOnaRoknpKkZ/WCkKRvlC8StWB
         a+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739409705; x=1740014505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+nCXvcuGbP6lZuLocKajT0ORe5EGrF6T3/N8VpC8fs=;
        b=A0SPWyya2J7r2o5MbzZAWlbqEBpYmciuMiwMeYujyzqDQOlcY7/wFbQnQsA5lJJthd
         U7QVL6nFCGmVaygQZ4zzYCZEI4qdbe9Ee6kD2mdYONUPKZCQWPF/p4kAgX/AEO7dKJY2
         p38yTKUVqGVI11iOiIs0fuurcREwxHeey2/bFSd5/9H280l3GwpZ2aJ49CPfBFyM7dbm
         VaQPRlXKo8zI6wNU3YelnWf+0kj0YBEatNW29PkAQQ7Q9vcWHtcZBkQGKY9XqnUU3zF/
         Nh5oEEXoqm1u6DZkgS/nL6V/tjad2I8UOE7DIHuD87nPVeNcpjdqX5gbq7Xrnh1/7g+R
         sGaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjmH4wEyenc90aI+4/qtHKGzjpkwrzPb8ftrvgpl/afLFXhTOEFTwJpaOE51Xf+V20/RHJh5h9SBGoneA1bGs2@lists.infradead.org, AJvYcCXUeSmbBl9erxkxP+lbn2qEXjdXEm0nGzsHeQfRIOjZvPXXqqmoKeLyApp7BSoKADOmvUxdfsHVPZJopIY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7JyygI7HYSP3s3xxruCWBoNmSXnQM8YaDUu+VybPaCh7V2fWW
	7Kqi+o0txzr9kPpS6JrMRJbHW3krGzJHyGrk4pYa9k7OpxVIQtorRFgX33OtAvNBYHnduYBrlLA
	cX/JmQsMjwe8RMz3drtweB/btags=
X-Gm-Gg: ASbGncvKsUgJ4WVbJGAcQOM5fito+8XrIust8I6MAMsWVfTo/BceQQdESuzLdP81sly
	dSwVa4eX5knnCLqTtRk0Zg1nZcPvaiIS83/+xaMYJo+W7VQ4IPbWwKwaecF/T5Ju323wXhfTlFO
	8=
X-Google-Smtp-Source: AGHT+IEjJMkC/hHaotdqSukhMJQZrOiaCkGtVrbEkJiI15zjYiRvHohJ4FkUwvWx7PY95qrg/tcG6HP5nsDWETkesBs=
X-Received: by 2002:a05:600c:198b:b0:439:60bc:71b3 with SMTP id
 5b1f17b1804b1-43960bc744emr6893225e9.25.1739409704648; Wed, 12 Feb 2025
 17:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com> <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com> <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
In-Reply-To: <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 13 Feb 2025 02:21:33 +0100
X-Gm-Features: AWEUYZnQToSGphLmBmZFBpfuiZIg1iWlon9vHp3PXB7Fk9evMSAokOcZX5tZFRE
Message-ID: <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_172147_219655_4EF4C0C9 
X-CRM114-Status: GOOD (  16.45  )
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

T24gVHVlLCBGZWIgMTEsIDIwMjUgYXQgNzowN+KAr1BNIE1hY2llaiBXaWVjem9yLVJldG1hbgo8
bWFjaWVqLndpZWN6b3ItcmV0bWFuQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBJIGRpZCBzb21lIGV4
cGVyaW1lbnRzIHdpdGggbXVsdGlwbGUgYWRkcmVzc2VzIHBhc3NlZCB0aHJvdWdoCj4ga2FzYW5f
bWVtX3RvX3NoYWRvdygpLiBBbmQgaXQgc2VlbXMgbGlrZSB3ZSBjYW4gZ2V0IGFsbW9zdCBhbnkg
YWRkcmVzcyBvdXQgd2hlbgo+IHdlIGNvbnNpZGVyIGFueSByYW5kb20gYm9ndXMgcG9pbnRlcnMu
Cj4KPiBJIHVzZWQgdGhlIEtBU0FOX1NIQURPV19PRkZTRVQgZnJvbSB5b3VyIGV4YW1wbGUgYWJv
dmUuIFVzZXJzcGFjZSBhZGRyZXNzZXMgc2VlbQo+IHRvIG1hcCB0byB0aGUgcmFuZ2UgW0tBU0FO
X1NIQURPV19PRkZTRVQgLSAweGZmZmY4ZmZmZmZmZmZmZmZdLiBUaGVuIGdvaW5nCj4gdGhyb3Vn
aCBub24tY2Fub25pY2FsIGFkZHJlc3NlcyB1bnRpbCAweDAwMDdmZmZmZmZmZmZmZmYgd2UgcmVh
Y2ggdGhlIGVuZCBvZgo+IGtlcm5lbCBMQSBhbmQgd2UgbG9vcCBhcm91bmQuIFRoZW4gdGhlIGFk
ZHJlc3NlcyBzZWVtIHRvIGdvIGZyb20gMCB1bnRpbCB3ZQo+IGFnYWluIHN0YXJ0IHJlYWNoaW5n
IHRoZSBrZXJuZWwgc3BhY2UgYW5kIHRoZW4gaXQgbWFwcyBpbnRvIHRoZSBwcm9wZXIgc2hhZG93
Cj4gbWVtb3J5Lgo+Cj4gSXQgZ2F2ZSBtZSB0aGUgc2FtZSByZXN1bHRzIHdoZW4gdXNpbmcgdGhl
IHByZXZpb3VzIHZlcnNpb24gb2YKPiBrYXNhbl9tZW1fdG9fc2hhZG93KCkgc28gSSdtIHdvbmRl
cmluZyB3aGV0aGVyIEknbSBkb2luZyB0aGlzIGV4cGVyaW1lbnQKPiBpbmNvcnJlY3RseSBvciBp
ZiB0aGVyZSBhcmVuJ3QgYW55IGFkZHJlc3NlcyB3ZSBjYW4gcnVsZSBvdXQgaGVyZT8KCkJ5IHRo
ZSBkZWZpbml0aW9uIG9mIHRoZSBzaGFkb3cgbWFwcGluZywgaWYgd2UgYXBwbHkgdGhhdCBtYXBw
aW5nIHRvCnRoZSB3aG9sZSA2NC1iaXQgYWRkcmVzcyBzcGFjZSwgdGhlIHJlc3VsdCB3aWxsIG9u
bHkgY29udGFpbiAxLzh0aAooMS8xNnRoIGZvciBTVy9IV19UQUdTKSBvZiB0aGF0IHNwYWNlLgoK
Rm9yIGV4YW1wbGUsIHdpdGggdGhlIGN1cnJlbnQgdXBzdHJlYW0gdmFsdWUgb2YgS0FTQU5fU0hB
RE9XX09GRlNFVCBvbgp4ODYgYW5kIGFybTY0LCB0aGUgdmFsdWUgb2YgdGhlIHRvcCAzIGJpdHMg
KDQgZm9yIFNXL0hXX1RBR1MpIG9mIGFueQpzaGFkb3cgYWRkcmVzcyBhcmUgYWx3YXlzIHRoZSBz
YW1lOiBLQVNBTl9TSEFET1dfT0ZGU0VUJ3MgdmFsdWUgaXMKc3VjaCB0aGF0IHRoZSBzaGFkb3cg
YWRkcmVzcyBjYWxjdWxhdGlvbiBuZXZlciBvdmVyZmxvd3MuIEFkZHJlc3Nlcwp0aGF0IGhhdmUg
YSBkaWZmZXJlbnQgdmFsdWUgZm9yIHRob3NlIHRvcCAzIGJpdHMgYXJlIHRoZSBvbmNlIHdlIGNh
bgpydWxlIG91dC4KClRoZSBLQVNBTl9TSEFET1dfT0ZGU0VUIHZhbHVlIGZyb20gbXkgZXhhbXBs
ZSBkb2VzIHJlbHkgb24gdGhlCm92ZXJmbG93IChhcmd1YWJseSwgdGhpcyBtYWtlcyB0aGluZ3Mg
bW9yZSBjb25mdXNpbmcgWzFdKS4gQnV0IHN0aWxsLAp0aGUgcG9zc2libGUgdmFsdWVzIG9mIHNo
YWRvdyBhZGRyZXNzZXMgc2hvdWxkIG9ubHkgY292ZXIgMS8xNnRoIG9mCnRoZSBhZGRyZXNzIHNw
YWNlLgoKU28gd2hldGhlciB0aGUgYWRkcmVzcyBiZWxvbmdzIHRvIHRoYXQgMS84dGggKDEvMTZ0
aCkgb2YgdGhlIGFkZHJlc3MKc3BhY2UgaXMgd2hhdCB3ZSB3YW50IHRvIGNoZWNrIGluIGthc2Fu
X25vbl9jYW5vbmljYWxfaG9vaygpLgoKVGhlIGN1cnJlbnQgdXBzdHJlYW0gdmVyc2lvbiBvZiBr
YXNhbl9ub25fY2Fub25pY2FsX2hvb2soKSBhY3R1YWxseQpkb2VzIGEgc2ltcGxpZmllZCBjaGVj
ayBieSBvbmx5IGNoZWNraW5nIGZvciB0aGUgbG93ZXIgYm91bmQgKGUuZy4gZm9yCng4NiwgdGhl
cmUncyBhbHNvIGFuIHVwcGVyIGJvdW5kOiBLQVNBTl9TSEFET1dfT0ZGU0VUICsKKDB4ZmZmZmZm
ZmZmZmZmZmZmZiA+PiAzKSA9PSAweGZmZmZmYmZmZmZmZmZmZmYpLCBzbyB3ZSBjb3VsZCBpbXBy
b3ZlCml0LgoKWzFdIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MjE4MDQzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
