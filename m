Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85012C8303F
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5m3pYwAc/IUaWN7//CoXvC4dkRdE9BWXh3EP4cNf5OI=; b=o1hpa/vn64HMOJ
	ecB716vHjbGa/hNeDdycYHZrPtubYCFWv4ee5dpnnPO6wHAjimH9mvALV9mhL52twE89qOjYMUwO7
	lNg9gHnFV5Zdi2tz/8JUJbrlfDsI1XGD2A2W2/KsiMJRaOIYt90SvZrHFe4uAZipGMOgErpURuFUK
	85ngOaUXiAf3IRoD1/tZI67nCdZEfk3pf5GjQDcExMNZb7U+AqBPXpfXFVkuC1LK+Se94Xhpdmb9k
	3sG+JijZiV+fmvJGjSpf/7muL28ENNj2U4fst6jbG+gcv34lli3H0gofegKl9G/uk9G8zNcJxGW1j
	PHplQYIxrqpdAG3QxElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgMc-00000002RBb-05V4;
	Thu, 28 Aug 2025 17:24:42 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbU6-00000001TnA-1tfr;
	Thu, 28 Aug 2025 12:12:08 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-324e2c12f43so158500a91.3;
        Thu, 28 Aug 2025 05:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756383125; x=1756987925; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=;
        b=LvQ8ZJrjoRWI63H2lsPTzNIqsQlrevxPu8ladX829sYWI2Qc/lBHXUJMBYLoQeJGwb
         TZl9PsS8cxqB+MP7ilqLmtNyVFFFXP0SHtLTOZwWW0PIZvf7Y1DLuGZqEOBP0QQ8KbUl
         8b5/MHZourJ8f87v1PPQ8C9cFMMehvTmdKzrYb1AJf5f99xQo5NQD/5YZZ8poHMEW0hv
         O54oo/BJoH0JVaHh/4lEbg5aiUh1djCMwXk5uOU/V0sKXJ6Zm8fGuH3epQCF3wuY935+
         qAKZrKr3nMbgYSYeR64yMVROQ8AzKc07afJF6GEhOeJeNdYLSzbJDc12mJe2iKKtpx1d
         NYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383125; x=1756987925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=;
        b=nehtUEiB5xRv7hktgVyOz0c/fus+1dbvLT0vHmyyVM7ei1kXqS9KrA03pvAcKWLB08
         j0y5gE5dFUuqtWGbZFY587xrcbNTGjV/MZ0HBhaZFfmJOeHB/grkOYcBdZwFs3EHYMLO
         rsnm7l0ppQwCrJcNykOxf4u6DihEAUPeJ3DWE/EYlrV6XP8h9TvS80B+RtQsxsxMg2G7
         9ai+ssYwFQNd5HU1pCUm2QooyvQ975dbydYw3ddhTruaHowvqHjqqOpxd83SjCnCOo4v
         K8ePajy67qnwo6mnWWZVk9iwfDeY1c6HEWiGHNuhvIb+cMQW3IarJsKmObpuQiMKNSl2
         mXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSAWQP3YdR2GvjQUZrWHiPq61GjsciPVLN3i2BhaXYn/sT6YWWkiPtdKNPwikBZSwvPtLhMzDoJ5xp2m0=@lists.infradead.org, AJvYcCXd8ooBP1FkKRr0daoPMUWsXM8wtvo9/0AT8ElKAG+K+W9YAMJDDoHc0QuiL1/WFx7ElA4nEIOCKoAGo8vufgOg@lists.infradead.org
X-Gm-Message-State: AOJu0YxbZJxgKkseUkmgMTkrPIeCxhFfUfG3JrVj5LlxCIg+DDbuJS0I
	A7MiVkcDO3kAK49rCYFlk+fniqAO175Hw+kOXr3fttyy5p7zprHC2aPAlp5Z1jHb24L9hKV7f+b
	mSvVCV4nx/yg9YnEmm5r0G0N7JqhEjhI=
X-Gm-Gg: ASbGncvRmazznZzYXIYAW0Drg/bEK/fiAg+//DqEB+vCNbmgMrlXzK8d9YEcdpVqMjB
	B/hOiX3PwiNXAPP6YBFhjXQ9OvgFwbGWy2rrRRg/upRk+l5Ideh1JxXc5LaF5Lt6hErWCNpZ6uR
	mdokwvvZB3IgqKQKBHyaRuchyZvr+C+3cLSlWugAZYfONAo5r5dj0o14fQ4lWoDCCIUUMobjwZx
	v0b9kqxIFq6w+4qhxJY2Pxte/jVXtt+OxEneENe4JGkVDZ8VXkeGGu2EuW0D4CltJAcnrrGr0Ai
	t7vlYzlLaqlbMm17pEyoYwVu/EiPdL69vgCCUMVOEAz8iXY=
X-Google-Smtp-Source: AGHT+IEHY3yqO9UJS3OJVe1SDsi7P25l1Vl9fz/i5xssn5nzwTw3KmrO7fDBd0I6tpqkx5s1cY/itDMI0psIb4lzmPQ=
X-Received: by 2002:a17:90b:1d03:b0:327:c9bb:be51 with SMTP id
 98e67ed59e1d1-327c9bbbf98mr469357a91.1.1756383125171; Thu, 28 Aug 2025
 05:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162>
In-Reply-To: <20250827193815.GA2293657@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 Aug 2025 14:11:51 +0200
X-Gm-Features: Ac12FXyJC97cqOYkicibM9SLfUWzcvxlb3Xn6gpRe98j59S9iV5Oq9n8aEdlnuk
Message-ID: <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051206_491104_23B1E866 
X-CRM114-Status: GOOD (  15.95  )
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

T24gV2VkLCBBdWcgMjcsIDIwMjUgYXQgOTozOOKAr1BNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBJIGFtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0
IHlvdSBtZWFuIGhlcmUuIFdpdGggdGhlIHNlcmllcyBhcyBpdCBpcwo+IG9yIEtlZXMncyBzdWdn
ZXN0ZWQgZml4LCBvbGRjb25maWcgc3RpbGwgcHJvbXB0cyB0aGUgdXNlciB0byBlbmFibGUKPiBD
T05GSUdfQ0ZJIHdpdGggQ09ORklHX0NGSV9DTEFORz15IGluIHRoZSBvbGQgY29uZmlndXJhdGlv
bi4gQm90aCBNaWd1ZWwKPiBhbmQgSSBhbGx1ZGUgdG8gdGhhdCBiZWluZyBmaW5lIGJ1dCBpdCB3
b3VsZCBiZSByZWFsbHkgbmljZSBpZiB1c2Vycwo+IHdpdGggQ09ORklHX0NGSV9DTEFORz15IHdl
cmUgYXV0b21hdGljYWxseSB0cmFuc2l0aW9uZWQgdG8gQ09ORklHX0NGST15Cj4gd2l0aG91dCBh
bnkgYWN0aW9uIG9uIHRoZWlyIHBhcnQuIFRoYXQgc2VlbXMgdG8gYmUgaW4gbGluZSB3aXRoIGhv
dwo+IExpbnVzIGZlZWxzIGV2ZW4gYXMgcmVjZW50bHkgYXMgdGhpcyBwYXN0IG1lcmdlIHdpbmRv
dzoKPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL0NBSGstPXdnTzBSeDJMY1lUNGY3NVhzNDZv
cmJKNEp4TzJqYkFGUW5WS0RZQWpWNUhlUUBtYWlsLmdtYWlsLmNvbS8KClllYWgsIEkgdGhpbmsg
Zm9yIHB1cmUgcmVuYW1lcyBvbmUgd2Ugc2hvdWxkIHRyeSB0byBhdm9pZCBjaHVybiBpZiBwb3Nz
aWJsZS4KCj4gQW5vdGhlciBpZGVhIEkgaGFkIHRvIGF2b2lkIHRoaXMgaXMgaW50cm9kdWNpbmcg
Q09ORklHX0NGSV9HQ0MgYXMgYSB1c2VyCj4gc2VsZWN0YWJsZSBzeW1ib2wgYW5kIG1ha2luZyBD
T05GSUdfQ0ZJIHRoZSBoaWRkZW4gc3ltYm9sIHRoYXQgYm90aAo+IGNvbXBpbGVyIHN5bWJvbHMg
c2VsZWN0LiBBZnRlciBhIGNvdXBsZSBvZiByZWxlYXNlcyAob3IgbWF5YmUgdGhlIG5leHQKPiBM
VFMpLCBib3RoIENPTkZJR19DRklfQ0xBTkcgYW5kIENPTkZJR19DRklfR0NDIGNvdWxkIGJlIGVs
aW1pbmF0ZWQgd2l0aAo+IENPTkZJR19DRkkgYmVjb21pbmcgdXNlciBzZWxlY3RhYmxlLCB3aGlj
aCB3b3VsZCBrZWVwIHRoaW5ncyB3b3JraW5nCj4gc2luY2UgQ09ORklHX0NGST15IHdpbGwgYmUg
cHJlc2VudCBpbiB0aGUgcHJldmlvdXMgY29uZmlndXJhdGlvbi4KCklmIHdlIGFyZSBPSyB3aXRo
IHNvbWV0aGluZyBsaWtlIHRoaXMgKGkuZS4gd2FpdGluZyBhIGZldyByZWxlYXNlcyksCnRoZW4g
aXNuJ3QgaXQgc2ltcGxlciB0aGUgYGRlZl9ib29sYCBhcHByb2FjaCBJIG1lbnRpb25lZD8gaS5l
LiBpdAptZWFucyBvbmUgbGVzcyBzeW1ib2wgYW5kIG9uZSBsZXNzIHJlbmFtZSBsYXRlciwgcmln
aHQ/CgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
