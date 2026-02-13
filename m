Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959E6EEA849
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 01:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouN0v+GlJxblMDuCpPgRzzYvZUC93LVjFscs8cRIE78=; b=hsNX04eMQVWLxD
	onuMLXZBLr2ayNpMewurcPurByQS1F5xbIkCRmReSvMGoqtbXPbRmVXuE8XHOI5NFeDk9BxzTdAMU
	5hCBB4MAEpZ7yZXjj80bGoTX8FrjKcU0Iltj/8kWNzVwHlE1VG3Bt6RWHKnfFKZg1bm8w3V9IyH3M
	3jN9YL83wdRumOo4yB3SlPp6oSMd5+BiMfaV/FoMYoxCxo/EF3L7GSO/Yld1A7YpomZ+i74nL6EJj
	9Q4Tn2um1LqB5cFQgaC4k9R6YzkP1EkLq77EU3HSK6/E1CVZo9aKvp2rldS4wSARE9emnsVDBVZCz
	T33vyXrJ42OTnKpKPCDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhpY-00000002p1b-0nsa;
	Fri, 13 Feb 2026 01:18:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqhpW-00000002p1J-0gUD
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 01:18:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso5032345e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Feb 2026 17:18:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770945524; cv=none;
        d=google.com; s=arc-20240605;
        b=eJKlB+thG0YGP4phQ/nvmTqgbnR7EsBY3ecchWZ0doE+4H9KFzzxzLRVc9cQyPp9Sh
         2D7/rlbW5Idv5TR3HF+KWWDZV5OqAvM7ETcIbsgmcuaIBlVI/LHA1IsbwZgw4lDVHqHg
         8wADWZvSzjvNhZbSQEP1Fl5BQzlWUPHH3BdBgLiH2r6AwpFT/7jDuuNZxQv+ZcQqUKrX
         OykmsYsaa/LJUmb1FsZQcbzY1+Rf9WtjvI8dWsBkDVfEeCBU6hqMsr316ErwnmXQim+1
         EVULk3WO4NBIHCBKtn93GnoxWWhXATrUrZqIoeQcblhrK0EAbgiVoUIGaqqIhP+91At5
         WDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OZSRRVYzY430fomwax5NRx8Sjn9D6g/BVgf8bkwafgs=;
        fh=GOYi3yLDDq/RHD5H5L41VEiechi+51mnb737dAOC3Zk=;
        b=O31EuAydmyKM0eNXboF3UxUGfLeGU2Fhv8UICtivGgu+aTjPUhYr7UkYdOjuWGl6hQ
         /p3edBTPqrdRlMtZquo3Z6XslMwU9moPgTSCC3YCYshlv4iXbg48ceitoUzmtZbYZWea
         Cma5FC82vhNTFPTX4R49jJ1BN4QPFDTp9HaeqL14XHK3orKm+56XyB5i3a7RFvrHpkJ7
         2Zj2zPAbHu9lQTWumJ388U/93OFEOp7It52R3FhQ/F9JU38Su0Apt+QAdkbY+KUopLR2
         aD4DNhRNQqhfdgQHMo3A1rg2JNfAWBOrVIWmsxgY/Ozl+92/iMlwDKhWxyKTl0tcwRWk
         BPXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770945524; x=1771550324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZSRRVYzY430fomwax5NRx8Sjn9D6g/BVgf8bkwafgs=;
        b=Luc3303QweHLKTE5QHXZ3cjxYg0AtShIdQKEAuMMsQnW9PXg88Onil1xs3m29J5kRC
         A2Rg/M0uHKj6gaJDQxc9/kZJcovmX6kpeLLGLNc0n61+/b7EPzgRCcgz+9EgpAGsGp9n
         y+sQBF4ViRReJs8t0cySZ7nlBuuhxgTeWDnuqCFDn0pC5Gaiv2cJ9wp0d/w8B2GdnHRn
         OpEQr7H3kfTyOwFNpP0WygdTGJrcpeAtmQGjjVBY/XByXUONEkzqmLk3kQNYKbw1C62J
         5qrar0EvwL21NMfCcQjhDwNBvHzB6P+tUDHM/aanoD7HdGApXsolZ6RASi8xhDmAZlNR
         +Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770945524; x=1771550324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZSRRVYzY430fomwax5NRx8Sjn9D6g/BVgf8bkwafgs=;
        b=vtsO5yfUzFOL52t8gSe+jSoCdTuAXoyWU5iTV0cycarp06LU8GjpmbiInFjPcQVMGl
         zAEMyamoikD9BO+0fW1HO3c2AwQbE5qJkVpILjTrlrUKM0cR2NGkJmaJkNfhjfqZH+MC
         l2QTMr19iXJMOToOojv9nVExBSmZ+y6Ssxc7BsGmt2SrQNWoKqhj0TK4o/tXSE7N1VHq
         v0JvXKeTUQLpRcnY7sAFpcX7W2t42AlQwrZLGxH0DxP09RlJVgnDe16KJRtgq8Xsly9+
         WMLMOFxPkZVwCAmR3hMccWyryvkEGbG9qy9UVh9h+c3e3SD3A1OmyBmrEIouQG197xYQ
         dsAw==
X-Forwarded-Encrypted: i=1; AJvYcCWtF2VIyRO0S9bOe/NU3Px48N+n6FTtYy3fHAI0Tk3O8mQOjd4WRXeWW0EMgf913nU2w2bia5i0OOO5bQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/C2i2OcGJj40TLmWgts9F06TXoWaJwpflJR6jkT0dG90km8tV
	lIRYHHg+sBc8wrCaPFdCZpBQh36erhiYouOEx5hMTF0R5vLqL5+rCNYbbjR/BDM7PLFQY0HoVbg
	/oSY6P2MZl97+MV6EjcSgipuVv7l3Xzk=
X-Gm-Gg: AZuq6aLn1CAuFOPSoHY100l0WpyYbYmchlDAdh7IQ4gLI4ugzjwIiX4iuK6gmyIC2DZ
	K0yVhaaPNyg/LIcSetnZ5VuIvIDvhyeIuhLs3HVaUaIP8BwECh8GCwJW8RVwdOXPMkDGAIbRccV
	8SK5uFMg4NLnOg9PqtVa1pbVOQEgM4mv2fl1UH7oT7cOdHqf8xKCkDk2pCOorwfjP2Kf2hWEqc6
	LE/mmpaJLyXs1zmhGAKsTjE/KOLWpWF4sa0jJ9DHdc/NFgM5gXO+6sjx2se78OrFexqpKBGuHPc
	J7cFRjQ=
X-Received: by 2002:a05:6000:2307:b0:436:1517:aeca with SMTP id
 ffacd0b85a97d-437978cb385mr541832f8f.15.1770945524088; Thu, 12 Feb 2026
 17:18:44 -0800 (PST)
MIME-Version: 1.0
References: <aW3gFmOlA/Z4kmfJ@adminpc-PowerEdge-R7525> <55cbf9fb-6d13-a893-e8b0-429fe972e207@kernel.org>
In-Reply-To: <55cbf9fb-6d13-a893-e8b0-429fe972e207@kernel.org>
From: Austin Kim <austindh.kim@gmail.com>
Date: Fri, 13 Feb 2026 10:18:32 +0900
X-Gm-Features: AZwV_QgYsSZGY24rbqDJE54TuwiMj6tNCEHW-mlOzJCLp6D0nGbRSRpLnp8cNTE
Message-ID: <CADLLry6FxqXtsOOyXu4o1Xmc2AueBxm5x1ap2FBz1zgt_E9YLw@mail.gmail.com>
Subject: Re: [PATCH] riscv: increase COMMAND_LINE_SIZE value to 2048
To: Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_171846_237171_3F3584B9 
X-CRM114-Status: UNSURE (   7.82  )
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

SGVsbG8gUGF1bCwKCjIwMjbrhYQgMuyblCAxM+ydvCAo6riIKSBBTSA5OjUyLCBQYXVsIFdhbG1z
bGV5IDxwandAa2VybmVsLm9yZz7ri5jsnbQg7J6R7ISxOgo+Cj4gT24gTW9uLCAxOSBKYW4gMjAy
NiwgQXVzdGluIEtpbSB3cm90ZToKPgo+ID4gRnJvbTogQXVzdGluIEtpbSA8YXVzdGluLmtpbUBs
Z2UuY29tPgo+ID4KPiA+IFNvQyBwZW9wbGUgbWF5IHNlbmQgbWFueSBwYXJhbWV0ZXJzIHRvIGNv
bmZpZ3VyZSB0aGUgZHJpdmVycyB2aWEga2VybmVsCj4gPiBjb21tYW5kIGxpbmUuIElmIENPTU1B
TkRfTElORV9TSVpFIGlzIG5vdCBlbm91Z2gsIHRoZXkgbWF5IGdvIHRocm91Z2gKPiA+IHVuZXhw
ZWN0ZWQgZXJyb3IuCj4gPgo+ID4gVG8gYXZvaWQgdGhlIHBvdGVudGlhbCBwYWluLCB3ZSBoYWQg
YmV0dGVyIGluY3JlYXNlIENPTU1BTkRfTElORV9TSVpFLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEF1c3RpbiBLaW0gPGF1c3Rpbi5raW1AbGdlLmNvbT4KPgo+IFRoYW5rcywgcXVldWVkIGZvciB2
Ny4xLgoKR3JlYXQhIFRoYW5rIHlvdS4KCkJSLApBdXN0aW4gS2ltCgo+Cj4KPiAtIFBhdWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
