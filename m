Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9C5FD0048
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Mar 2026 01:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgdWFOhAmfpOYcNMCZhQGehVWK8KR1YNaggYj/ZTv34=; b=Ajfc5EZwjRfq4f
	iXWux6Tj0lgOFI/oHyygW0b7Tmx0/I7QzT7BL9F12KkpEZlQPXhQfFMGdYX/vQkMo/cC0u4wKnNAy
	QZJEjuksuVcBjYXg0MWNPuQN7TRQGsvN5TOZA8oJPZaGp2gH9oGuaDjHJDX94gz74oTCtLaZHuxmC
	UtANIjEWAoMptq68ZQLphggMCdOAkNWcpNyk5mxDllyRyoGK36Uivbn94lQvuX0s7A90C4PgQI7zl
	HLtWXqjUQaixkul9dwta5E1OUGxEaNXh4d75Tc90fpCJkQPN2tzCQWKda5ZUXodtH0A6Cx2EH1hDL
	oiUcTjkLmpO9JpqxzKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW4j-0000000AhFz-0iix;
	Sun, 01 Mar 2026 01:58:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwW4g-0000000AhED-2bsy
	for linux-riscv@lists.infradead.org;
	Sun, 01 Mar 2026 01:58:28 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-65fac0b51baso6555290a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Feb 2026 17:58:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772330304; cv=none;
        d=google.com; s=arc-20240605;
        b=MPBAh/jnr4Pykl/LkC8axrYLNvtMY6MT7LqDcbFq/68bqj39RkLtk5XpVUhbrP7I54
         3Mvje8ILEi5IbC7tKBdibCe4MBfC/byjEZd5S1wX0EdktXeDX1I8kJSUsj+Ir2JyVKUK
         880PajtwN82G18MwKqDxNjfO4Aw899LqD5NsmNAQwEwxO395GWPizWWnEChcsPY4pkJ8
         GC9/50bTTm7TYZ0TPXk672119ToHica7+BqFQMD03kIc/HtXOd3q9yL4UcSQ0eFQ9VCN
         iTzfnltXLg//ujDKK6cfjEFAoYv7LMDsyMbNk6rwwORsa0VXUGFwyAtupqAGHFyoMDvX
         T4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=54nUUoZYBk6/nmzbYKQgAP9HVkFunlgn9EvNWRbux98=;
        fh=36Q1zASCp06HL9Xc+eVCFcd4FImaPfJOKeEouEKO9Gg=;
        b=HTuDVQJ3pXlOUbZDIhXuKdDb+REq+q5v1CtQga63C6vMxYJOBhqWTcQpfvKUQKtqVq
         g78PaFARGsNYPJIcrHxuv3cKuIXAJmTx7ERR0TDeGUhZYczxCtulsEi61dr85paNUVCk
         jqOvKUwycIEq869lCayChh9ZseTgcGYX3Ls6WAgCYrxouA3O/O5QfsDl39xG4uWjkHGj
         gutXjyPv7VrRNv/pYkJq1MBkPzfC0lQSPta2UcuNHWnbacVSTHheUq64KQBEqTj0tylG
         xUTB1qqgj0HXKEHmgoHnVHxmhKOr49A75QvAOVAZjs/txDMN0PxOJenyrsdMzxjRYHU9
         elAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1772330304; x=1772935104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54nUUoZYBk6/nmzbYKQgAP9HVkFunlgn9EvNWRbux98=;
        b=FmWAQDqrYTjWu+ZjVn9VaQmNx67wGbxeTMVIxrpmN3uCNjiQFkeUzv5k4rEjDki/+T
         7uBlENomtXC5AIp23N/A3FpkWMSk+oaNKzyawzxc0YExkajgKsUlaXrdK3aLeG/MOuSB
         B/kMhjw2CHmoZhx/XDgqq3Tk8sbxlWlrZb5LzIPlG59lywNyAGcceAJX+M7cveyM7ekp
         n4YrBnXoQZbWLpi7pyLsJY8ArhZQGAigUt1CZn+f4cyTw4lqdnQk1v8lBN0fraP9GyPC
         O1omC7RhHOB57aTsNb8j4DfBOt1gMWi8saN3+EHWRTKEoZUkauSHOVvB9MJBp6G8DOKd
         IgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772330304; x=1772935104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=54nUUoZYBk6/nmzbYKQgAP9HVkFunlgn9EvNWRbux98=;
        b=ToYbAGL5RDc1lPsLRg5hr4wk6dVM6iWJff1nfkJGU0nsDVkEnUm4GneVgJEqBvd0Dr
         4jWEOsXkXkFfw7c5iU31EGmJOz3/QuLzYVG3W8pfWwZ5grQ+GNbYtS4UIcPOAcX4tLKR
         RV7SsVQJgpNULwySP/N6PjcYHYZi8Mkh5VrtPhtjKyKOegYLvRBIvJKaWxUXgnimYy4e
         wyEJ5IcmIuFGXwJMt+1WW9043NFuq5x1rtCAMDQ/HY10clhErBiSYOSW8PtAfRnUHjk+
         /p6OP1G5tnop3wnNQ6ALF+YgG7MCkzkNx59h5PTKJnJ4aMajcYBvAn3Pug0SybAwRHoy
         ngmA==
X-Forwarded-Encrypted: i=1; AJvYcCWqcie6+FsA2Qqk4bfn6EK2QguJbVqvJwOHmi0gFV3TERUA8Y17uk7MMfZOuwa8FuZh7N/q3+027Qnntg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv3Zhczlwu7J9xulynM+uO4m0emiQAqhF2U14cVBasrP+VWREP
	sGW+3NPt8EqyRfPNzAxqnsxzbjXMGMSi7pGPQOm4zRmj3L7W3utiq+c7I0Y9W8OJEfWQhrfegZN
	B26JLWXMwPNVL6ij8XQ2sZTubKOI3wCuRi5oB3dgspQ==
X-Gm-Gg: ATEYQzzgiFM0K7lWbIwJDQrnWxK9Ctyq+JlUBjIs7/TeWfy77XXkxvXClL4QlNet28c
	754ubBr0dsE+Z0MvE/j7AGaDWYTwDp4R6M8c09o1ycC6n7cteMXKIc4OLjptwr7W7Xr7k5AgiSs
	oBHKBRM01dKKiAfCjDh1lyCQmvTdNvTKr85FAidmUZB5B0NlWMg0GA4cL9VaIVXLC2M6fCdC99p
	GKlaQm1YKzrycZ7fOY1Zv6McGOgQ6Tf9CXEC+Zf9p/CAupODxxCNlVNozFqRu33X303Qhn3h5py
	gLxYRBEzvA==
X-Received: by 2002:a50:ee17:0:b0:65a:22d5:7b63 with SMTP id
 4fb4d7f45d1cf-65fab6651b6mr4667409a12.0.1772330303825; Sat, 28 Feb 2026
 17:58:23 -0800 (PST)
MIME-Version: 1.0
References: <0CA1C3965143B3A7+cover.1772289741.git.lv.zheng@linux.spacemit.com>
In-Reply-To: <0CA1C3965143B3A7+cover.1772289741.git.lv.zheng@linux.spacemit.com>
From: Zong Li <zong.li@sifive.com>
Date: Sun, 1 Mar 2026 09:58:17 +0800
X-Gm-Features: AaiRm52qOWLub30nWjAt6tJggFFKYVIu-tGYIIKePM15Tk_NmHt3UvAlC9ff53s
Message-ID: <CANXhq0o6JELxZETcfdsr2i6Xp6SCbwAxnMdfjXkyGRi2EeWsNA@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] iommu/riscv: Add HPM support for RISC-V IOMMU
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Yixun Lan <dlan@kernel.org>, 
	Jingyu Li <joey.li@spacemit.com>, Yaxing Guo <guoyaxing@bosc.ac.cn>, 
	Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_175826_727266_9F4818A1 
X-CRM114-Status: GOOD (  36.46  )
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

T24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgMTA6NDTigK9QTSBMdiBaaGVuZyA8bHYuemhlbmdAbGlu
dXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IEluY2x1ZGVzIEhQTSBzdXBwb3J0IGZvciBSSVND
LVYgSU9NTVUuIFRoZSBIUE0gaGFyZHdhcmUgbWVjaGFuaXNtIGNhbiBiZQo+IGZvdW5kIGluIHRo
ZSByZWNlbnQgYW5ub3VuY2VkIFNwYWNlbWlUIFNvQ3MgKEszLCBWMTAwKSwgd2hlcmUgVDEwMAo+
IChTcGFjZW1pVCBkaXN0cmlidXRlZCBJT01NVSkgaXMgc2hpcHBlZC4KPgo+IFRoZSBSSVNDLVYg
SU9NTVUgc3BlY2lmaWNhdGlvbiBkZWZpbmVzIG9wdGlvbmFsIEhQTSByZWdpc3RlcnMgKElPSFBN
RVZULAo+IElPSFBNQ1RSLCBldGMuKSBmb3IgcGVyZm9ybWFuY2UgbW9uaXRvcmluZyBvZiB0cmFu
c2FjdGlvbnMgdGhyb3VnaCB0aGUKPiBJT01NVS4gU3BhY2VtaVQgVDEwMCBpbXBsZW1lbnRzIHRo
aXMgc3BlY2lmaWNhdGlvbiB3aXRoIGEgZGlzdHJpYnV0ZWQKPiBhcmNoaXRlY3R1cmU6IHRoZSBt
YWluIElPTU1VIChJT0FUUykgaXMgY29tcGxlbWVudGVkIGJ5IHVwIHRvIDY0IElPQVRDCj4gdW5p
dHMgdGhhdCBjYWNoZSBJT1RMQnMgYWRqYWNlbnQgdG8gRE1BIG1hc3RlcnMuIEVhY2ggSU9BVEMg
aGFzIGl0cyBvd24KPiBIUE0gY291bnRlcnMgYW5kIFBNSVYgaW50ZXJydXB0Lgo+Cj4gVGhpcyBz
ZXJpZXMgaW50cm9kdWNlcyBhbiBhdXhpbGlhcnkgYnVzIGZyYW1ld29yayB0byBhbGxvdyB0aGUg
SFBNCj4gZnVuY3Rpb25hbGl0eSB0byBiZSBpbXBsZW1lbnRlZCBhcyBhIHNlcGFyYXRlIHBlcmYg
ZHJpdmVyLCBrZWVwaW5nIHRoZQo+IElPTU1VIGNvcmUgZm9jdXNlZCBvbiB0cmFuc2xhdGlvbi4g
VmVuZG9yLXNwZWNpZmljIGV4dGVuc2lvbnMgKFNwYWNlbWlUCj4gVDEwMCkgYXJlIGxheWVyZWQg
b24gdG9wIG9mIHRoZSBnZW5lcmljIEhQTSBpbmZyYXN0cnVjdHVyZS4KPgo+IEhpc3Rvcnk6Cj4g
VGhlIGZpcnN0IHJldmlzaW9uIG9mIHRoaXMgc2VyaWVzIGlzIHBvc3RlZCB3aXRob3V0IHRoZSBh
d2FyZW5lc3Mgb2YKPiBvdGhlciBvbi1nb2luZyBkaXNjdXNzaW9ucy4gVGhlcmUgYXJlIG90aGVy
IHBvc3RpbmdzIHByb3ZpZGluZyBzYW1lCj4gZnVuY3Rpb25hbGl0eSBhcyBbUEFUQ0ggMi0zXSBp
biB0aGlzIHRocmVhZDoKPiAxLiBab25nIExpOgo+ICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI1MDExNTAzMDMwNi4yOTczNS0xLXpvbmcubGlAc2lmaXZlLmNvbS8KPiAgICBXZSBh
bGlnbmVkIHdpdGggWm9uZyBpbiB0aGUgY29tbXVuaXR5IGhlcmU6Cj4gICAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsL0NBTlhocTBxOE41ZUh4OXl0YWJaUjk3WTdBVUxLd2dTMi11RUdoY2FP
T0dwOW12YnRSUUBtYWlsLmdtYWlsLmNvbS8KPiAgICA+PiBQZXJoYXBzIEkgY2FuIGZpcnN0IHBv
c3QgbXkgbmV4dCByZXZpc2lvbiB0byB0aGUgbWFpbGluZyBsaXN0IChob3BlCj4gICAgPj4gaXQg
d29uJ3Qgd2FzdGUgdGhlIGNvbW11bml0eSByZXNvdXJjZSksIHNvIHRoYXQgeW91IGNvdWxkIGhh
dmUgYQo+ICAgID4+IGNoYW5jZSB0byByZXZpZXcgaXQgYW5kIHNlZSB3aGV0aGVyIHRoYXQgdmVy
c2lvbiBpcyBhcmNoaXRlY3R1cmFsbHkKPiAgICA+PiBjbG9zZXIgdG8gd2hhdCB0aGUgY29tbXVu
aXR5IGlzIGxvb2tpbmcgZm9yLCB3aGlsZSBhbHNvIGFkZHJlc3NpbmcKPiAgICA+PiB5b3VyIGlz
c3VlLiBJZiB5b3UgYWxzbyBmZWVsIHRoYXQgbXkgbmV4dCByZXZpc2lvbiBtZWV0cyB5b3VyIG5l
ZWRzLAo+ICAgID4+IHBlcmhhcHMgeW91IGNvdWxkIGFwcGVuZCB5b3VyIGFkZGl0aW9uYWwgaW1w
bGVtZW50YXRpb25zIG9uIHRvcCBvZgo+ICAgID4+IGl0Lgo+ICAgID4+IE9mIGNvdXJzZSwgaWYg
dGhlIGNvbW11bml0eSB3b3VsZCBwcmVmZXIgdG8gZ28geW91ciB2ZXJzaW9uLCBJJ20KPiAgICA+
PiBwZXJmZWN0bHkgZmluZSB3aXRoIHRoYXQgYXMgd2VsbC4KPiAgICBIaXMgbmV3ZXN0IHZlcnNp
b24gY2FuIGJlIGZvdW5kIGhlcmU6Cj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjYwMjA4MDYzODQ4LjM1NDc4MTctMS16b25nLmxpQHNpZml2ZS5jb20vCgpJIGRvbuKAmXQgdGhp
bmsgdGhpcyB2NSBzZXJpZXMgaXMgYXBwcm9wcmlhdGUuIEluIHRoZSBiZWdpbm5pbmcsIHlvdQpw
b3N0ZWQgYSBzaW1pbGFyIGltcGxlbWVudGF0aW9uIHdpdGhvdXQgc3VmZmljaWVudCBkaXNjdXNz
aW9uLCBidXQgaXQKbWlnaHQgYmUgb2sgYmVjYXVzZSBhcyB5b3UgbWVudGlvbmVkLCB5b3UgZGlk
IHNvIGJlY2F1c2UgeW91IHdlcmUgbm90CmF3YXJlIGF0IHRoZSB0aW1lLiBIb3dldmVyLCBpbiB0
aGlzIHY1IHNlcmllcywgeW91IGhhdmUgYWdhaW4gaW5jbHVkZWQKb3VyIGltcGxlbWVudGF0aW9u
IGNvbmNlcHQgd2l0aG91dCBwcmlvciBkaXNjdXNzaW9uIG9yIGFncmVlbWVudAooaS5lLiwgc2Vw
YXJhdGVzIHRoZSBJT01NVSBQTVUgZHJpdmVyIGludG8gZHJpdmVycy9wZXJmLyB0aHJvdWdoIHRo
ZQphdXhpbGlhcnkgZnJhbWV3b3JrKS4gVGhpcyBtYXkgbm90IGZ1bGx5IGFsaWduIHdpdGggdGhl
IGxvbmctc3RhbmRpbmcKb3Blbi1zb3VyY2UgY29sbGFib3JhdGlvbiBtb2RlbCBpbiB0aGUgTGlu
dXggY29tbXVuaXR5LCBJbiBhZGRpdGlvbiwKb3VyIHYyIHNlcmllcyBpcyBzdGlsbCB3YWl0aW5n
IGZvciBmZWVkYmFjayBhbmQgcmVzcG9uc2VzIGZyb20gdGhlCmNvbW11bml0eS4gSSBiZWxpZXZl
IGl0IG1heSBub3QgYmUgYXBwcm9wcmlhdGUgdG8gZGlyZWN0bHkgdGFrZSBvdXIKaW1wbGVtZW50
YXRpb24gYW5kIGluY2x1ZGUgaXQgaW4geW91ciBzZXJpZXMuCmh0dHBzOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9waXBlcm1haWwvbGludXgtcmlzY3YvMjAyNi1GZWJydWFyeS8wODUzNDkuaHRtbAoK
SWYgeW91IHdvdWxkIGxpa2UgdG8gYnVpbGQgb24gdG9wIG9mIG91ciBpbXBsZW1lbnRhdGlvbiBh
bmQgYWRkIHlvdXIKb3duIGNoYW5nZXMsIEkgdGhpbmsgYSBiZXR0ZXIgYXBwcm9hY2ggd291bGQg
YmUgdG8gZmlyc3QgY29tbXVuaWNhdGUKd2l0aCB1cywgYW5kIHRoZW4gYXQgbGVhc3QgY2hlcnJ5
LXBpY2sgb3VyIGltcGxlbWVudGF0aW9uIGFzIHRoZQppbml0aWFsIHBhdGNoZXMgKGkuZS4sIHBh
dGNoIDEgYW5kIHBhdGNoIDIpLiBBZnRlciB0aGF0LCB5b3UgY291bGQKcGxhY2UgeW91ciBvd24g
Y2hhbmdlcyBzdGFydGluZyBmcm9tIHRoZSB0aGlyZCBwYXRjaC4KCgo+IDIuIFlheGluZyBHdW86
Cj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwOTE1MDIwOTExLjEzMTMtMS1n
dW95YXhpbmdAYm9zYy5hYy5jbi8KPiAgICBZYXhpbmcgYW5kIFpvbmcgYWxpZ25lZCBlYWNoIG90
aGVyIGluIHRoZSBjb21tdW5pdHkgaGVyZToKPiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1pb21tdS8yY2U5ZDhiZS0xMGIzLTQ4ZGQtYjk5ZS03MzU4MzQ3ZmMxNzFAYm9zYy5hYy5j
bi8KPiAgICA+PiBIaSBab25nIExpLAo+ICAgID4+IE9mIGNvdXJzZSB5ZXMsIGFic29sdXRlbHkg
LSBJIHdhc24ndCBhd2FyZSBvZiB5b3VyIGVhcmxpZXIKPiAgICA+PiBzdWJtaXNzaW9uLiBQbGVh
c2UgZ28gYWhlYWQgd2l0aCB5b3VyIHZlcnNpb24uCj4gVGhpcyBpcyB0aGUgbmV3ZXN0IHJldmlz
aW9uIG9mIHRoaXMgcGF0Y2hzZXQsIGFuZCBbUEFUQ0ggMi0zXSBpcyB0aGUgb25lCj4gdGhhdCBp
cyBjb21wZXRpbmcgd2l0aCBvdGhlciBjb250cmlidXRpb25zLgo+Cj4gUmV2aXNpb25zOgo+IHYx
Cj4gIEluaXRpYWwgcmVsZWFzZS4KPiB2MiAoc2VudCBhcyB2MS4xKQo+ICBTcGxpdCBhbmQgY2xl
YW51cCBEVC1iaW5kaW5ncy4KPiB2Mwo+ICAxLiBSZWZhY3RvciB1c2luZyB2ZW5kb3Igc3BlY2lm
aWMgY29tcGF0aWJsZS4KPiAgMi4gSW1wbGVtZW50IHZlbmRvciBldmVudHMgd2l0aCBhIHVzZXJz
cGFjZSBpZGVudGlmaWVyLgo+IHY0Cj4gIDEuIERyb3AgSUNWRUMgY2hlY2sgd2hpY2ggaXMgbm90
IHRoYXQgdXNmdWwgYXMgV1NJIGRldmljZSB0cmVlIGNhbiB1c2UKPiAgICAgb25seSAxIHZlY3Rv
ciBmb3IgSU9BVFMgQ0lWL0ZJVi9QSVYvUE1JVi4KPiAgMi4gU29sdmUgRFQgYmluZGluZyBjaGVj
ayBvZiAiaW50ZXJydXB0cy9tYXhJdGVtcyIgYXR0cmlidXRlLgo+ICAzLiBBZGRyZXNzIFJvYmlu
J3MgY29tbWVudHMgZm9yIGFuIG9sZCByZXZpc2lvbiBzZW50IGJ5ICJab25nIExpIi4KPiAgNC4g
TGltaXQgSU9BVEMgZW51bWVyYXRpb24gYnkgcmVmZXJlbmNpbmcgc3BhY2VtaXQscmlzY3YtaW9t
bXUuCj4gdjU6Cj4gIDEuIFVzZSBjb3JyZWN0IHN0eWxlIFNvQy9JUCBzcGVjaWZpYyBjb21wYXRp
YmxlLgo+ICAyLiBBZGRyZXNzIGFsbCBvbi1nb2luZyBjb21tZW50cyBpbiBvdGhlciB0aHJlYWRz
Lgo+ICAzLiBTcGxpdCBjb21wYXRpYmxlIGludG8gU29DIHNwZWNpZmljIGFuZCBJUCBzcGVjaWZp
Yy4KPiAgNC4gU3dpdGNoIHRvIHVzZSBhdXhpbGlhcnkgZGV2aWNlIGZyYW1ld29yay4KPgo+IFRo
ZSB0ZXN0ZWQgcmVzdWx0IGNhbiBiZSBmb3VuZCBhcyBmb2xsb3dzOgo+Cj4gIHJvb3RAc2RmaXJt
OiMgcGVyZiBzdGF0IC0tdGltZW91dCA1MDAwIC1hIC1lIHNwYWNlbWl0X2lvYXRzX2hwbV8wL2Rk
X3dhbGssY29uZmlnMT0weDIwYzAwMTAwMDAwMDAwMDAvIGRtYXRlc3Q7IHNsZWVwIDEKPiAgWyAg
NDUzLjQyNjQwNF0gZG1hdGVzdDogU3RhcnRlZCAxIHRocmVhZHMgdXNpbmcgZG1hMGNoYW4wCj4g
IFsgIDQ1My40MzcxNTJdIGRtYXRlc3Q6IGRtYTBjaGFuMC1jb3B5MDogc3VtbWFyeSAxIHRlc3Rz
LCAwIGZhaWx1cmVzIDIxMi4wNCBpb3BzIDIxMiBLQi9zICgwKQo+Cj4gICBQZXJmb3JtYW5jZSBj
b3VudGVyIHN0YXRzIGZvciAnc3lzdGVtIHdpZGUnOgo+Cj4gICAgICAgICAgICAgICAgICAgMyAg
ICAgIHNwYWNlbWl0X2lvYXRzX2hwbV8wL2RkX3dhbGssY29uZmlnMT0weDIwYzAwMTAwMDAwMDAw
MDAvCj4KPiAgICAgICAgIDAuMTkwNDEyMDAwIHNlY29uZHMgdGltZSBlbGFwc2VkCj4KPiAgcm9v
dEBzZGZpcm06fiMgcGVyZiBzdGF0IC0tdGltZW91dCA1MDAwIC1hIC1lIHNwYWNlbWl0X2lvYXRj
X2hwbV8xL3RsYl9taXMsY29uZmlnMT0weDIwYzAwMTAwMDAwMDAwMDAvIGRtYXRlc3Q7IHNsZWVw
IDEKPiAgWyAgMTE3LjU5OTYyMF0gZG1hdGVzdDogU3RhcnRlZCAxIHRocmVhZHMgdXNpbmcgZG1h
MGNoYW4wCj4gIFsgIDExNy42MTA2OThdIGRtYXRlc3Q6IGRtYTBjaGFuMC1jb3B5MDogc3VtbWFy
eSAxIHRlc3RzLCAwIGZhaWx1cmVzIDE4Ni4wNyBpb3BzIDE4NiBLQi9zICgwKQo+Cj4gICBQZXJm
b3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAnc3lzdGVtIHdpZGUnOgo+Cj4gICAgICAgICAgICAg
ICAgICAgNyAgICAgIHNwYWNlbWl0X2lvYXRjX2hwbV8xL3RsYl9taXMsY29uZmlnMT0weDIwYzAw
MTAwMDAwMDAwMDAvCj4KPiAgICAgICAgIDAuMTk2OTgyMDAwIHNlY29uZHMgdGltZSBlbGFwc2Vk
Cj4KPiBKaW5neXUgTGkgKDMpOgo+ICAgaW9tbXUvcmlzY3Y6IEVuYWJsZSBJT01NVSBETUEgbWFw
cGluZyBzdXBwb3J0Cj4gICBpb21tdS9yaXNjdjogQWRkIGF1eGlsaWFyeSBidXMgZnJhbWV3b3Jr
IGFuZCBIUE0gZGV2aWNlIHN1cHBvcnQKPiAgIGlvbW11L3Jpc2N2OiBBZGQgSFBNIHN1cHBvcnQg
Zm9yIHBlcmZvcm1hbmNlIG1vbml0b3JpbmcKPgo+IEx2IFpoZW5nICg1KToKPiAgIGR0LWJpbmRp
bmdzOiBpb21tdTogQWRkIHNwYWNlbWl0L3QxMDAgZmVhdHVyZXMKPiAgIHNwYWNlbWl0L3QxMDA6
IEFkZCBnbG9iYWwgZmlsdGVyIGF3YXJlbmVzcyBmb3IgUklTQy1WIElPTU1VIEhQTQo+ICAgaW9t
bXUvcmlzY3Y6IEFkZCBTcGFjZW1pVCBUMTAwIElPQVRDIEhQTSBzdXBwb3J0Cj4gICBpb21tdS9y
aXNjdjogQWRkIHZlbmRvciBldmVudCBzdXBwb3J0IGZvciBSSVNDLVYgSU9NTVUgSFBNCj4gICBw
ZXJmIHZlbmRvciBldmVudHMgcmlzY3Y6IEFkZCBTcGFjZW1pVCBUMTAwIEhQTSBldmVudCBhbGlh
c2VzCj4KPiAgLi4uL2JpbmRpbmdzL2lvbW11L3Jpc2N2LGlvbW11LnlhbWwgICAgICAgICAgIHwg
ICA1OCArLQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgICA1ICsKPiAgZHJpdmVycy9pb21tdS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAgMiArLQo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAg
ICAgfCAgICAxICsKPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1iaXRzLmggICAgICAgICAg
ICAgIHwgICAxMiArCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGNpLmMgICAgICAgICAg
ICAgICB8ICAgIDggKy0KPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wbGF0Zm9ybS5jICAg
ICAgICAgIHwgICAgNyArLQo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgICAgICAgICAg
ICAgICAgICAgfCAgMzA2ICsrKysrCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuaCAgICAg
ICAgICAgICAgICAgICB8ICAgMjUgKy0KPiAgZHJpdmVycy9wZXJmL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgOSArCj4gIGRyaXZlcnMvcGVyZi9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgIDEgKwo+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfaW9tbXVfaHBt
LmMgICAgICAgICAgICAgICAgfCAxMDEyICsrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGlu
dXgvcmlzY3ZfaW9tbXUuaCAgICAgICAgICAgICAgICAgICB8ICAgODMgKysKPiAgLi4uL2FyY2gv
cmlzY3Yvc3BhY2VtaXQvaW9tbXUvc3lzL2lvYXRjLmpzb24gIHwgICAzMCArCj4gIC4uLi9hcmNo
L3Jpc2N2L3NwYWNlbWl0L2lvbW11L3N5cy9pb2F0cy5qc29uICB8ICAxNjMgKysrCj4gIDE1IGZp
bGVzIGNoYW5nZWQsIDE3MTUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGVyZi9yaXNjdl9pb21tdV9ocG0uYwo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9saW51eC9yaXNjdl9pb21tdS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9zcGFjZW1pdC9pb21tdS9zeXMvaW9h
dGMuanNvbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gv
cmlzY3Yvc3BhY2VtaXQvaW9tbXUvc3lzL2lvYXRzLmpzb24KPgo+IC0tCj4gMi40My4wCj4KPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
