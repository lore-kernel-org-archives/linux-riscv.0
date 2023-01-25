Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE00C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 16:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7d1wlc3AZnBVTIr+MjRrfHu46qHfiIDhc9EA5//1u8o=; b=iNwgR6TK5Lia0A
	vrL7GJUDPmLWDtn6b2My9sET0s2QR3aYdJwf+7MCjHuwmAXQ1Oi1yfDZVmzV2bJUWf8oIpdHKq8+T
	LipOPvpdqk3EmoL/eCUgdndeHqYFQ6zFP6afAHPOprj5nSx8z92zMejGmSLnGN9fNzbiLlDRNF6MD
	d2va07zDvqYArpUtYITC70u12Tx+7YhK2puRAZrN9g7iH6Zy5eAdk/bG3+RqCvdsTmEO8V22Sl46Q
	UDWdBuShFA8nAQUrd/KgBMvla7IfSDKXn2Qk/ovTHoO3WnwknZS1aZOxH8/TYV6qvNkNMv7v2y4hd
	QHzrsp6OoHdHmjhoz76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKilT-007xxM-Hh; Wed, 25 Jan 2023 16:36:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKilI-007xvC-QX; Wed, 25 Jan 2023 16:36:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83DD84B3;
	Wed, 25 Jan 2023 08:37:15 -0800 (PST)
Received: from bogus (unknown [10.57.77.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C30ED3F5A1;
	Wed, 25 Jan 2023 08:36:30 -0800 (PST)
Date: Wed, 25 Jan 2023 16:36:28 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arch_topology: Build cacheinfo from primary CPU
Message-ID: <20230125163628.4yjwh3ja5vxnirun@bogus>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
 <20230104183033.755668-7-pierre.gondois@arm.com>
 <CAMuHMdUjgxgOXf5He1x=PLn7MQTjZgFQUHj8JrwbyweT4uOALQ@mail.gmail.com>
 <20230124140420.4srnufcvamvff77v@bogus>
 <Y8/tl999NQwbPL/R@wendy>
 <20230124144839.2szjjv256j3pdaif@bogus>
 <20230124145541.2xwtr7ro2bjnsjd7@bogus>
 <20230125145423.pid3hsstswzuez73@bogus>
 <CAMuHMdWZ+_kdMp+0VfYAJZRHBWiyobQQJwEM_kHN6yeVVGxSvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWZ+_kdMp+0VfYAJZRHBWiyobQQJwEM_kHN6yeVVGxSvg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_083636_923875_7391439C 
X-CRM114-Status: GOOD (  16.66  )
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

T24gV2VkLCBKYW4gMjUsIDIwMjMgYXQgMDQ6Mjg6MDRQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIFN1ZGVlcCwKPgo+IE9uIFdlZCwgSmFuIDI1LCAyMDIzIGF0IDM6NTQg
UE0gU3VkZWVwIEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4gd3JvdGU6Cj4gPiBPbiBUdWUs
IEphbiAyNCwgMjAyMyBhdCAwMjo1NTo0MVBNICswMDAwLCBTdWRlZXAgSG9sbGEgd3JvdGU6Cj4g
PiA+IEdlZXJ0LCBjYW4geW91IHBsZWFzZSB0cnkgd2l0aCB0aGUgcGF0Y2ggQ29ub3IgcG9pbnRl
ZCBvdXQgYW5kIHNlZSBpZgo+ID4gPiB0aGF0IGhlbHBzIHRvIGZpeCB0aGUgYWxsb2NhdGlvbiBm
YWlsdXJlc1sxXQo+ID4gPgo+ID4KPiA+IFNvcnJ5IGZvciB0aGUgbmFnLCBidXQgZGlkIHlvdSBn
ZXQgdGhlIGNoYW5jZSB0byB0ZXN0IC1uZXh0IHdpdGggWzFdCj4gPiBhbmQgc2VlIGlmIGl0IGZp
eGVzIHRoZSBjYWNoZWluZm8gbWVtb3J5IGZhaWx1cmUgeW91IHdlcmUgb2JzZXJ2aW5nID8KPgo+
ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDEwMzAzNTMxNi4zODQxMzAz
LTEtbGV5Zm9vbi50YW5Ac3RhcmZpdmV0ZWNoLmNvbS8KPgo+IEFmdGVyIGFwcGx5aW5nIHRoYXQg
cGF0Y2gsIHRoZSBpc3N1ZSBpcyBnb25lLgo+IFRoYW5rcywgc2VuZGluZyBteSBUYiEKPgoKVGhh
bmtzIGZvciB0ZXN0aW5nIGFuZCBzb3JyeSBmb3Igd3JvbmcgaW5mb3JtYXRpb24gaW4gbXkgUFIu
IEkgaGFkIG1peGVkCnVwIHRoaW5ncyBhbmQgYXNzdW1lZCBpdCB3YXMgdGVzdGVkLiBJIHVzdWFs
bHkgbGVhdmUgaXQgaW4gLW5leHQgZm9yIGEgd2VlawpiZWZvcmUgc2VuZGluZyBQUiBidXQgcnVz
aGVkIHRoaW5ncyBvbmNlIEkgd2FzIGJhY2sgZnJvbSB0aGUgaG9saWRheXMsIHdvbid0CnJlcGVh
dCBob3BlZnVsbHkg8J+kni4KCi0tClJlZ2FyZHMsClN1ZGVlcAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
