Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6284BC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/jTnTEsf5yrhh9/XMLGQilNJDHiZgkRCqfIGy8Xm+8=; b=1I5JRPVnPHYKcK
	EzzfNP0KrkphWWTPH1MVEzWxdEbgz49OWyfP275lsYMQWF+s6PhP8t40oMtqNzZsRqtTJsOUt3X9x
	SrNvH7aK8rpUACqILORadSfismLxWYhUX7bH9fueVc6DcyApBbCKFbGQ0j6BrnGJ1DqQlcaMFhJC0
	PYcpx3X4jqyZ3A2BdPYy/cfRrq90Qnbk643RP2oOZzyPj4UJvQKxhWx4YBfLFH73OErINVcOnBe2T
	yKmrwsFeC3kIh+UJLFRj2CnqXyKVlFiqssSX3kaJ78uXZmRg5M/5tkI4TA2c8LVs5ciogwhxMhsmZ
	X3QNCbaLoJo/ponQvCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3eza-005sxf-Bn; Tue, 21 Jun 2022 14:36:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ezY-005sx8-3g
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 14:36:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 72496CE19FC;
	Tue, 21 Jun 2022 14:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7A8C3411C;
	Tue, 21 Jun 2022 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655822183;
	bh=9hzVJBmXejWxqKoWbTYAA5mBykUEAvY+19xhKlfx+aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9XH0EAkI74XOBgpK92u1iqaQqlF0Y5PaZFC9rX4RJWOuJSVJ6268ltKh196Uo5Do
	 geb/cdM+8qvDgcfiue/PulRRVnhw2W3dZY5G1/hdVBDtVESzt5DuTuguC5gtAaJ4Z1
	 hfwKwY5OmnlhzASl4GhLJFBvltZK70nVMaEJ/qQU=
Date: Tue, 21 Jun 2022 16:36:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Bin Liu <b-liu@ti.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH v2 0/2] Add support for PolarFire SoC's musb controller
Message-ID: <YrHXZYe4e4vlCHh3@kroah.com>
References: <20220613114642.1615292-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613114642.1615292-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_073632_382361_34D8D703 
X-CRM114-Status: GOOD (  17.70  )
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

T24gTW9uLCBKdW4gMTMsIDIwMjIgYXQgMTI6NDY6NDFQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IEhleSBCaW4sIEdyZWcsCj4gU2hvcnQgc2VyaWVzIGhlcmUgYWRkaW5nIHN1cHBvcnQg
Zm9yIFVTQiBvbiBNaWNyb2NoaXAgUG9sYXJGaXJlIFNvQyBGUEdBcy4KPiBUaGUga2NvbmZpZyBk
ZXBlbmRlbmN5IGZvciBJTlZFTlRSQV9ETUEgaGFzIGJlY29tZSBhIGJpdCBvZiBhIG1vdXRoZnVs
LAo+IGlzIHRoZXJlIGEgYmV0dGVyIHdheSBvZiBkZWFsaW5nIHdpdGggdGhhdD8KPiBUaGFua3Ms
Cj4gQ29ub3IuCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIERyb3AgdW5uZWVkZWQgcmVzb3Vy
Y2UgY29weWluZyBhcyBwZXIgUm9iJ3MgY2hhbmdlcyB0byB0aGUgb3RoZXIgZHJpdmVycwo+IC0g
RHJvcCB0aGUgZHRzIHBhdGNoCj4gCj4gQ29ub3IgRG9vbGV5ICgyKToKPiAgIHVzYjogbXVzYjog
QWRkIHN1cHBvcnQgZm9yIFBvbGFyRmlyZSBTb0MncyBtdXNiIGNvbnRyb2xsZXIKPiAgIE1BSU5U
QUlORVJTOiBhZGQgbXVzYiB0byBQb2xhckZpcmUgU29DIGVudHJ5Cj4gCj4gIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL3VzYi9tdXNiL0tjb25maWcgIHwgIDEz
ICstCj4gIGRyaXZlcnMvdXNiL211c2IvTWFrZWZpbGUgfCAgIDEgKwo+ICBkcml2ZXJzL3VzYi9t
dXNiL21wZnMuYyAgIHwgMjY1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgMjc5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdXNiL211c2IvbXBmcy5jCj4gCj4gCj4gYmFzZS1j
b21taXQ6IGYyOTA2YWE4NjMzODFhZmIwMDE1YTllYjdmZWZhZDg4NWQ0ZTVhNTYKPiAtLSAKPiAy
LjM2LjEKPiAKCkFueSBjaGFuY2UgeW91IGNhbiBnZXQgeW91ciBjb21wYW55IHRvIGZpeCB1cCB0
aGVpciBlbWFpbCBzZXR0aW5nczoKCkdyYWJiaW5nIHRocmVhZCBmcm9tIGxvcmUua2VybmVsLm9y
Zy9hbGwvMjAyMjA2MTMxMTQ2NDIuMTYxNTI5Mi0xLWNvbm9yLmRvb2xleSU0MG1pY3JvY2hpcC5j
b20vdC5tYm94Lmd6CkFuYWx5emluZyA0IG1lc3NhZ2VzIGluIHRoZSB0aHJlYWQKQ2hlY2tpbmcg
YXR0ZXN0YXRpb24gb24gYWxsIG1lc3NhZ2VzLCBtYXkgdGFrZSBhIG1vbWVudC4uLgotLS0KICDi
nJcgW1BBVENIIHYyIDEvMl0gdXNiOiBtdXNiOiBBZGQgc3VwcG9ydCBmb3IgUG9sYXJGaXJlIFNv
QydzIG11c2IgY29udHJvbGxlcgogIOKclyBbUEFUQ0ggdjIgMi8yXSBNQUlOVEFJTkVSUzogYWRk
IG11c2IgdG8gUG9sYXJGaXJlIFNvQyBlbnRyeQogIC0tLQogIOKclyBCQURTSUc6IERLSU0vbWlj
cm9jaGlwLmNvbQotLS0KVG90YWwgcGF0Y2hlczogMgoKSWYgSSBkaWRuJ3Qga25vdyBiZXR0ZXIs
IEkgd291bGQgdGhpbmsgeW91IHdlcmUgc3Bvb2ZpbmcgdGhlIGFkZHJlc3MuLi4KCnRoYW5rcywK
CmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
