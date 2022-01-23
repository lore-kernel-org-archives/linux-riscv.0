Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96987C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jan 2022 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEF6Jn0mdXoYKeR6SUKrDj1cNyHMNUeTj6+cFVFGGLU=; b=W9xFdf0Ey4GVwa
	Hzcd5GtwDc7VmpC0C/PPBShqW/ab3ah8Ovm4y/CDCkkl/xJWgJQUOyvRA8k8+p3jWKfUIsJ8Nekx2
	KGVv3xSZaMkP5TNIhcljtCCOLGbfmXJyv5W6qeXf4zDdJ0CBr5dzuEbTPVcky45p7TxqbwsWvUUCx
	4hmg7kqoyxDJd4+4CijajoXzW0lNaP7OW0wzEDUYk/L4TBIFqX2mQ5P47zERIyilQYWdm9zbRzQIE
	XyIymKMrAgd2KgGt12IsHCXzwv+ycnqYsN8pwAhFK3AXvyK9LScfsBarWgqhI6IfHGmTLylxI8kER
	lN7eGSNdFRYAQpbMUD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBfG3-001ENd-Aq; Sun, 23 Jan 2022 15:58:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBf31-0019ra-1c
 for linux-riscv@lists.infradead.org; Sun, 23 Jan 2022 15:44:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id e8so7358678wrc.0
 for <linux-riscv@lists.infradead.org>; Sun, 23 Jan 2022 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nfUCrgltiuESmGAEDtw9bdfISibes8TAv+qKIXGxuic=;
 b=Zz1rjr+Oaa1cFDW4Ogh1s0Dc6tRdjPe3+yJjgn9CXxfzgEto8FZ+qBc5OOqQt+wg2g
 86VMddvrTwe3r5BvseJWhSMizn31JbvnKgcrDhig3JnZk2XCLXgzqSWUC8NhyhnFEHQK
 0FP1z/IIQY1a0DG8xZ6zAWheMH4h2tsovocf5EFaEYtIY04+mKB3Y6qB986mMyv3y8Zv
 9ftdyp/cOWHazPHa9Zw6WnzHDb9q/rJgkv7k6VhCc30hD+4ZhueqoZcV5oLRNWJoJbyW
 rM+QaanVdc47C5HuUlHcN5c2Ekg8LZhLqcWlk/wBjm4g33CRo5QHhKE4uZaghxiD5MRn
 3zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nfUCrgltiuESmGAEDtw9bdfISibes8TAv+qKIXGxuic=;
 b=Jio5k8EO0HH+Ipo2cao+cXypqi1DAM7SlnxhWCL+zorfyeYutpkYkTmOLxhGCW0qeh
 Ikr4lWWbyD/m11qmopgIP8JpwcGBjl+yXirf8/TX3ccx4Kl2hMi5j0CSQT+8xQroF+83
 Ige7lFz548jdZUSPIvFZq4iIkpiSK1LaYM+VRVbVPv2BvRh3kNkG8UCP/FP9NWCnSQHO
 zWXzH0zbc1ZNqHMbzUcnTDRhgFYW227pXVrnuGCzkVC2LHTQIa3DfRegyt3UddcYrUlc
 aR+Koh89zmI0W9QEz1e4HEgXbDCR6c2wr/8Q6/z+SgGwLzuHq1x2musfjtA/KzYt8fV4
 rxrw==
X-Gm-Message-State: AOAM533ZSrmJEbEI/ElLnzVBCz6K2BXsEChQ9F19noxI+IvEL2mQ56Wv
 sMNRFOlw6xFL5OIMI/NvRjR6Tg==
X-Google-Smtp-Source: ABdhPJwuMCafdMGqKQ6AEE1aYdBVnMGozvO8SH5XCkPG9PcCYPue5hINzJBa4ikKxPcemlyvyMc8ZQ==
X-Received: by 2002:adf:f192:: with SMTP id h18mr358315wro.314.1642952692393; 
 Sun, 23 Jan 2022 07:44:52 -0800 (PST)
Received: from smtpclient.apple (global-5-142.nat-2.net.cam.ac.uk.
 [131.111.5.142])
 by smtp.gmail.com with ESMTPSA id l7sm13366441wrs.104.2022.01.23.07.44.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Jan 2022 07:44:52 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH v2] Fixed: Misaligned memory access. Fixed pointer
 comparison.
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220123034518.3717116-1-michael@michaelkloos.com>
Date: Sun, 23 Jan 2022 15:44:51 +0000
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-kernel@vger.kernel.org
Message-Id: <485047B2-E566-4679-87CF-C4B3CAFEF108@jrtc27.com>
References: <20220123034518.3717116-1-michael@michaelkloos.com>
To: "Michael T. Kloos" <michael@michaelkloos.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_074455_180221_282EA918 
X-CRM114-Status: GOOD (  16.74  )
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

T24gMjMgSmFuIDIwMjIsIGF0IDAzOjQ1LCBNaWNoYWVsIFQuIEtsb29zIDxtaWNoYWVsQG1pY2hh
ZWxrbG9vcy5jb20+IHdyb3RlOgo+IAo+IFJld3JvdGUgdGhlIHJpc2N2IG1lbW1vdmUoKSBhc3Nl
bWJseSBpbXBsZW1lbnRhdGlvbi4gIFRoZQo+IHByZXZpb3VzIGltcGxlbWVudGF0aW9uIGRpZCBu
b3QgY2hlY2sgbWVtb3J5IGFsaWdubWVudCBhbmQgaXQKPiBjb21wYXJlZCAyIHBvaW50ZXJzIHdp
dGggYSBzaWduZWQgY29tcGFyaXNvbi4gIFRoZSBtaXNhbGlnbmVkCj4gbWVtb3J5IGFjY2VzcyB3
b3VsZCBjYXVzZSB0aGUga2VybmVsIHRvIGNyYXNoIG9uIHN5c3RlbXMgdGhhdAo+IGRpZCBub3Qg
ZW11bGF0ZSBpdCBpbiBmaXJtd2FyZSBhbmQgZGlkIG5vdCBzdXBwb3J0IGl0IGluIGhhcmR3YXJl
Lgo+IEZpcm13YXJlIGVtdWxhdGlvbiBpcyBzbG93IGFuZCBtYXkgbm90IGV4aXN0LiAgQWRkaXRp
b25hbGx5LAo+IGhhcmR3YXJlIHN1cHBvcnQgbWF5IG5vdCBleGlzdCBhbmQgd291bGQgbGlrZWx5
IHN0aWxsIHJ1biBzbG93ZXIKPiB0aGFuIGFsaWduZWQgYWNjZXNzZXMgZXZlbiBpZiBpdCBkaWQu
ICBUaGUgUklTQy1WIHNwZWMgZG9lcyBub3QKPiBndWFyYW50ZWUgdGhhdCBzdXBwb3J0IGZvciBt
aXNhbGlnbmVkIG1lbW9yeSBhY2Nlc3NlcyB3aWxsIGV4aXN0Lgo+IEl0IHNob3VsZCBub3QgYmUg
ZGVwZW5kZWQgb24uCj4gCj4gVGhpcyBwYXRjaCBub3cgY2hlY2tzIGZvciB0aGUgbWF4aW11bSBn
cmFudWxhcml0eSBvZiBjby1hbGlnbm1lbnQKPiBiZXR3ZWVuIHRoZSBwb2ludGVycyBhbmQgY29w
aWVzIHRoZW0gd2l0aCB0aGF0LCB1c2luZyBzaW5nbGUtYnl0ZQo+IGNvcHkgZm9yIGFueSB1bmFs
aWduZWQgZGF0YSBhdCB0aGVpciB0ZXJtaW5hdGlvbnMuICBJdCBhbHNvIG5vdyB1c2VzCj4gdW5z
aWduZWQgY29tcGFyaXNvbiBmb3IgdGhlIHBvaW50ZXJzLgo+IAo+IEFkZGVkIGhhbGYtd29yZCBh
bmQsIGlmIGJ1aWx0IGZvciA2NC1iaXQsIGRvdWJsZS13b3JkIGNvcHkuCj4gCj4gTWlncmF0ZWQg
dG8gdGhlCW5ld2VyIGFzc2VtYmxlciBhbm5vdGF0aW9ucyBmcm9tIHRoZSBub3cgZGVwcmVjYXRl
ZAo+IG9uZXMuCj4gCj4gQ29tbWl0IE1lc3NhZ2UgRWRpdGVkIG9uIEphbiAyMiAyMDIyOiBGaXhl
ZCBzb21lIHR5cG9zLgo+IAo+IFt2Ml0KPiAKPiBQZXIga2VybmVsIHRlc3Qgcm9ib3QsIEkgaGF2
ZSBmaXhlZCB0aGUgYnVpbGQgdW5kZXIgY2xhbmcuICBUaGlzCj4gd2FzIGJyb2tlbiBkdWUgdG8g
YSBkaWZmZXJlbmNlIGJldHdlZW4gZ2NjIGFuZCBjbGFuZywgY2xhbmcgcmVxdWlyaW5nCj4gZXhw
bGljdCB6ZXJvIG9mZnNldHMgdGhlIGphbHIgaW5zdHJ1Y3Rpb24uIGdjYyBhbGxvd2VkIHRoZW0g
dG8gYmUKPiBvbWl0dGVkIGlmIHplcm8uCgpVbmxpa2UgTExWTSwgR0NDIGRvZXMgbm90IGhhdmUg
YW4gYXNzZW1ibGVyLCB0aGF04oCZcyBiaW51dGlsc+KAmXMgR05VIGFzLgoKSmVzcwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
