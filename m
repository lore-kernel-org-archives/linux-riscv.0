Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9311CC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 18:59:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55B592082E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 18:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r6GIyudt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55B592082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ymRKIGfnACSddgGtCbfwi58sNQDYLNZ/C3X2nG9xOx0=; b=r6GIyudtZAbLNWOjhgcCCTwLw
	Yjv+zuagkvIP82YYBzTXZeLff8lqT7n+BjtP9DBlep3qPCSU2hF7zPMvcSGYxry3cOIv7LHVlEcHn
	Z8dW0HFJhRDCqD2KeTouOvge1knlMqzvmBtwNnZsji6EhGOa7Ab0IsBTyZStPYqWh1JnrUieeMg50
	rMWmTzG+TCAuMgsfS2MbhPYc8hwJG1McCMNykTzX6UDmG77W7k8nLvTL4lZg+ijopVgGkhdV73XIT
	4zivin5qINy0pocCB5fzllkCSzyrm4tz5ZhibQDQJUEpvcm8l+oOr/saI24xoFw7Yfvlh++7fkKL+
	jbprS9R+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIefP-0000q0-0E; Fri, 02 Nov 2018 18:59:35 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIefL-0000dL-G2
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 18:59:33 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wA2IwfNC069634; Fri, 2 Nov 2018 20:58:43 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-4c-5bdc9e60aae2
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 EA.36.03682.06E9CDB5; Fri,  2 Nov 2018 20:58:40 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wA2Iwd6q019465; Fri, 2 Nov 2018 20:58:39 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 02 Nov 2018 20:58:39 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Organization: FORTH
In-Reply-To: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
Message-ID: <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsXSHc2orJsw7060wb0+S4ttS1azWrR8eMdq
 sWjFdxaL1vZvTBbzj5xjtTg9YRGTxeVdc9gstn1uYbNYev0ik8XmCQtYLVr3HmG32LxpKrPF
 85W9bA68HntOz2L2WDNvDaPH1N9nWDw2r9Dy2LSqk83j3blz7B6bl9R7XGq+zu7xeZOcR/uB
 bqYArigum5TUnMyy1CJ9uwSujKXvGlkL5ohWbJ6wmr2B8ZJAFyMnh4SAicSlRQeZuxi5OIQE
 jjBKdExZzArhHGSUaHs3mR2iylRi9t5ORhCbV0BQ4uTMJywgNrOAhcTUK/sZIWx5ieats5lB
 bBYBVYknmyeCxdkENCXmXzoIVM/BIQIUn7WIH2Q+s8AeJoldM5aD1QgL6Ek0bbjJCmLzCwhL
 fLp7EczmFHCRWHf8AliNkICzxLUnMDe4SHQvPs0IcZuKxIffD8DuFBVQlnhxYjrrBEahWUhO
 nYXk1FlITl3AyLyKUSCxzFgvM7lYLy2/qCRDL71oEyM47ub67mA8t8D+EKMAB6MSD69B5Z1o
 IdbEsuLK3EOMEhzMSiK8X1qBQrwpiZVVqUX58UWlOanFhxilOViUxHkPvwgPEhJITyxJzU5N
 LUgtgskycXBKNTAGZKhfbHuUk+v0OKB7Q/bPkvtfRI/Pn17A67NTJiNETP7fa2YLhfWzpEzF
 ZxTI+EWwcn9kbGhY3/5pZ27ShYxkw9gJM+88Wbkl0fb5X0OVmJkaOv9e7VvmV8GaE/2XKSLk
 SczHqstv9jg43V153u1Mm6RuyOXdV2tv3ly5JW5v1JW1Maty6jYpsRRnJBpqMRcVJwIA/dqV
 q7cCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_115931_899437_69B2CC21 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 alankao@andestech.com, hch@infradead.org, anup@brainfault.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, zong@andestech.com,
 robh+dt@kernel.org, linux-riscv@lists.infradead.org, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102185839.kdaA0aohu2J_ZRdR0OZReZpC-4YUVMyfzQM2KkG2V18@z>

SGVsbG8gQWxsLAoKzqPPhM65z4IgMjAxOC0xMS0wMiAwMTowNCwgQXRpc2ggUGF0cmEgzq3Os8+B
zrHPiM61Ogo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgdGhlIGNwdSB0b3BvbG9neSBmb3IgUklT
Qy1WLiBJdCBjb250YWlucwo+IGJvdGggdGhlIERUIGJpbmRpbmcgYW5kIGFjdHVhbCBzb3VyY2Ug
Y29kZS4gSXQgaGFzIGJlZW4gdGVzdGVkIG9uCj4gUUVNVSAmIFVubGVhc2hlZCBib2FyZC4KPiAK
PiBUaGUgaWRlYSBpcyBiYXNlZCBvbiBjcHUtbWFwIGluIEFSTSB3aXRoIGNoYW5nZXMgcmVsYXRl
ZCB0byBob3cKPiB3ZSBkZWZpbmUgU01UIHN5c3RlbXMuIFRoZSByZWFzb24gZm9yIGFkb3B0aW5n
IGEgc2ltaWxhciBhcHByb2FjaAo+IHRvIEFSTSBhcyBJIGZlZWwgaXQgcHJvdmlkZXMgYSB2ZXJ5
IGNsZWFyIHdheSBvZiBkZWZpbmluZyB0aGUKPiB0b3BvbG9neSBjb21wYXJlZCB0byBwYXJzaW5n
IGNhY2hlIG5vZGVzIHRvIGZpZ3VyZSBvdXQgd2hpY2ggY3B1cwo+IHNoYXJlIHRoZSBzYW1lIHBh
Y2thZ2Ugb3IgY29yZS4gIEkgYW0gb3BlbiB0byBhbnkgb3RoZXIgaWRlYSB0bwo+IGltcGxlbWVu
dCBjcHUtdG9wb2xvZ3kgYXMgd2VsbC4KPiAKCkkgd2FzIGFsc28gYWJvdXQgdG8gc3RhcnQgYSBk
aXNjdXNzaW9uIGFib3V0IENQVSB0b3BvbG9neSBvbiBSSVNDLVYKYWZ0ZXIgdGhlIGxhc3Qgc3d0
b29scyBncm91cCBtZWV0aW5nLiBUaGUgZ29hbCBpcyB0byBwcm92aWRlIHRoZQpzY2hlZHVsZXIg
d2l0aCBoaW50cyBvbiBob3cgdG8gZGlzdHJpYnV0ZSB0YXNrcyBtb3JlIGVmZmljaWVudGx5CmJl
dHdlZW4gaGFydHMsIGJ5IHBvcHVsYXRpbmcgdGhlIHNjaGVkdWxpbmcgZG9tYWluIHRvcG9sb2d5
IGxldmVscwooaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjQuMTkvaWRlbnQvc2No
ZWRfZG9tYWluX3RvcG9sb2d5X2xldmVsKS4KV2hhdCB3ZSB3YW50IHRvIGRvIGlzIGRlZmluZSBj
cHUgZ3JvdXBzIGFuZCBhc3NpZ24gdGhlbSB0bwpzY2hlZHVsaW5nIGRvbWFpbnMgd2l0aCB0aGUg
YXBwcm9wcmlhdGUgU0RfIGZsYWdzCihodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
YmxvYi9tYXN0ZXIvaW5jbHVkZS9saW51eC9zY2hlZC90b3BvbG9neS5oI0wxNikuCgpTbyB0aGUg
Y29yZXMgdGhhdCBiZWxvbmcgdG8gYSBzY2hlZHVsaW5nIGRvbWFpbiBtYXkgc2hhcmU6CkNQVSBj
YXBhY2l0eSAoU0RfU0hBUkVfQ1BVQ0FQQUNJVFkgLyBTRF9BU1lNX0NQVUNBUEFDSVRZKQpQYWNr
YWdlIHJlc291cmNlcyAtZS5nLiBjYWNoZXMsIHVuaXRzIGV0Yy0gKFNEX1NIQVJFX1BLR19SRVNP
VVJDRVMpClBvd2VyIGRvbWFpbiAoU0RfU0hBUkVfUE9XRVJET01BSU4pCgpJbiB0aGlzIGNvbnRl
eHQgSSBiZWxpZXZlIHVzaW5nIHdvcmRzIGxpa2UgImNvcmUiLCAicGFja2FnZSIsCiJzb2NrZXQi
IGV0YyBjYW4gYmUgbWlzbGVhZGluZy4gRm9yIGV4YW1wbGUgdGhlIHNhbXBsZSB0b3BvbG9neSB5
b3UKdXNlIG9uIHRoZSBkb2N1bWVudGF0aW9uIHNheXMgdGhhdCB0aGVyZSBhcmUgNCBjb3JlcyB0
aGF0IGFyZSBwYXJ0Cm9mIGEgcGFja2FnZSwgaG93ZXZlciAicGFja2FnZSIgaGFzIGEgZGlmZmVy
ZW50IG1lYW5pbmcgdG8gdGhlCnNjaGVkdWxlci4gQWxzbyB3ZSBkb24ndCBzYXkgYW55dGhpbmcg
aW4gY2FzZSB0aGV5IHNoYXJlIGEgcG93ZXIKZG9tYWluIG9yIGlmIHRoZXkgaGF2ZSB0aGUgc2Ft
ZSBjYXBhY2l0eSBvciBub3QuIFRoaXMgbWFwcGluZyBkZWFscwpvbmx5IHdpdGggY2FjaGUgaGll
cmFyY2h5IG9yIG90aGVyIHNoYXJlZCByZXNvdXJjZXMuCgpIb3cgYWJvdXQgZGVmaW5pbmcgYSBk
dCBzY2hlbWUgdG8gZGVzY3JpYmUgdGhlIHNjaGVkdWxlciBkb21haW4KdG9wb2xvZ3kgbGV2ZWxz
IGluc3RlYWQgPyBlLmc6CgoyIHNldHMgKG9yIGNsdXN0ZXJzIGlmIHlvdSBwcmVmZXIpIG9mIDIg
U01UIGNvcmVzLCBlYWNoIHNldCB3aXRoCmEgZGlmZmVyZW50IGNhcGFjaXR5IGFuZCBwb3dlciBk
b21haW46CgpzY2hlZF90b3BvbG9neSB7CiAgbGV2ZWwwIHsgLy8gU01UCiAgIHNoYXJlZCA9ICJw
b3dlciIsICJjYXBhY2l0eSIsICJyZXNvdXJjZXMiOwogICBncm91cDAgewogICAgbWVtYmVycyA9
IDwmaGFydDA+LCA8JmhhcnQxPjsKICAgfQogICBncm91cDEgewogICAgbWVtYmVycyA9IDwmaGFy
dDI+LCA8JmhhcnQzPjsKICAgfQogICBncm91cDIgewogICAgbWVtYmVycyA9IDwmaGFydDQ+LCA8
JmhhcnQ1PjsKICAgfQogICBncm91cDMgewogICAgbWVtYmVycyA9IDwmaGFydDY+LCA8JmhhcnQ3
PjsKICAgfQogIH0KICBsZXZlbDEgeyAvLyBNQwogICBzaGFyZWQgPSAicG93ZXIiLCAiY2FwYWNp
dHkiCiAgIGdyb3VwMCB7CiAgICBtZW1iZXJzID0gPCZoYXJ0MD4sIDwmaGFydDE+LCA8JmhhcnQy
PiwgPCZoYXJ0Mz47CiAgIH0KICAgZ3JvdXAxIHsKICAgIG1lbWJlcnMgPSA8JmhhcnQ0PiwgPCZo
YXJ0NT4sIDwmaGFydDY+LCA8JmhhcnQ3PjsKICAgfQogIH0KICB0b3BfbGV2ZWwgeyAvLyBBIGdy
b3VwIHdpdGggYWxsIGhhcnRzIGluIGl0CiAgIHNoYXJlZCA9ICIiIC8vIFRoZXJlIGlzIG5vdGhp
bmcgY29tbW9uIGZvciBBTEwgaGFydHMsIHdlIGNvdWxkIGhhdmUgCmNhcGFjaXR5IGhlcmUKICB9
Cn0KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
