Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0660CF327B9
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jm8F4nZ2DIk75MpNFW9nDGjr9pyQ8DcVUspUFNebFxE=; b=uz6M3hF5TM3CBM
	1DL8yi5xRZYngxqccQNCNxQ3RpsztHj0G46FZnIyZ9Z1878HmncGxPZQoFfrlCmZy4tU4cje/0YGT
	bTtT0T7czAxPeUIQQYTRx3Ryh7EJV17hHQI/Kp9oez+QYQFvnbAlZIBe2kosVrNHqDdguL2dczYzp
	+J50aKcUCoL0R8Rr5fCfrceNi9k726EuTMPCTyWk7xgzFvRoO9Rc3yc/KJDqHg8/jif/wKT+SiUxC
	zq9gkF0+tJ7ayhA2cHh8ddYaYlhUYwPHGhlIjLih7qj21J63z2t2FDIj+zsBR6vG+hiQ3rieuVv9y
	+Pv4G/zy9JyhZX1fHxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6CB-00000008EY2-2Ibr;
	Tue, 21 Apr 2026 08:10:59 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF6C8-00000008EXD-3MWj
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 08:10:58 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g0FRJ4rD5z9tMq;
	Tue, 21 Apr 2026 10:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776759052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tw5y/BjaWKbihGRIOsYkTlgniAaZpFkNRSj8PyADtm8=;
	b=dHhiLQWXIWgWFHaJiWrcbUeW05na81V5ClSqTnpiBMdlHHS+ddX5yPOhQN4CUfDvOifOm5
	CsSq6HZ64idqIQgd0FbGmyBtHSW0CKc971hEjXK1xMb5zG3S9lqNZ6d1dap736e9vNVEaC
	fNwf7+pnHoB1wfV0E3XogxIw17WRWOrruixz+kyV4r7PdqziKdFnClKr0BNDgzKlGgtPZQ
	vVJ0Qw/c1uPhxyYTszZXExAb4cff0lWCwF5/bCI/APZk5t9X+ZrvAEvHzq2jzDXqZzMQYm
	6z8Pzd+N8x9ow2AEYLmdlqUFtbWSZX9vYDNtVXk40PeZ2dAq9m4Qh8gr9acWNQ==
Mime-Version: 1.0
Date: Tue, 21 Apr 2026 16:10:39 +0800
Message-Id: <DHYOIIFMGH7J.228ISQ7XYFGKE@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Yixun Lan" <dlan@kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Aurelien Jarno" <aurelien@aurel32.net>, "Anand Moon"
 <linux.amoon@gmail.com>
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
 <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org>
 <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net>
In-Reply-To: <aeaXszeaE62rM6BJ@aurel32.net>
X-MBO-RS-ID: 898c96528d6322090f5
X-MBO-RS-META: dyrjym6i7ydcwho6k8h6h6sh3yn8yuoe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_011057_617252_F0EEC78A 
X-CRM114-Status: GOOD (  11.99  )
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

SGkgQXVyZWxpZW4sCgpUaGFua3MgZm9yIHlvdXIgYWRkaXRpb24uCgpPbiBUdWUgQXByIDIxLCAy
MDI2IGF0IDU6MTYgQU0gQ1NULCBBdXJlbGllbiBKYXJubyB3cm90ZToKPiBIaSBBbmFuZCwKPgo+
IE9uIDIwMjYtMDQtMTYgMTc6MDcsIEFuYW5kIE1vb24gd3JvdGU6Cj4+IEFmdGVyIHJldmlld2lu
ZyB0aGUgQmFuYW5hIFBpIEYzIHNjaGVtYXRpY3MsIEkgY29uZmlybWVkIHRoYXQgQnVjazEgYW5k
IEJ1Y2syCj4+IEJvdGggc3VwcGx5IHRoZSBDT1JFXzBWOSB3aXRoIDAuOVbCsTElIHJhaWwuIFRv
IHJlc29sdmUgdGhlIHJlc3RyaWN0aW9uIGVycm9ycywKPj4gSSBleHBhbmRlZCB0aGUgdm9sdGFn
ZSByYW5nZSBpbiB0aGUgRFRTIHRvIDUwMCwwMDDigJM5NTAsMDAwIMK1Vi4KPj4gCj4+IEFkZGl0
aW9uYWxseSwgSSB1cGRhdGVkIHRoZSBEVFMgdG8gbWFwIHRoZSBzZWNvbmQgQ1BVIGNsdXN0ZXIg
KGNvcmVzIDTigJM3KQo+PiB0byBCdWNrMiB0byBiZXR0ZXIgYWxpZ24gd2l0aCB0aGUgaGFyZHdh
cmUncyBwb3dlciBkaXN0cmlidXRpb24uCj4KPiBBY3R1YWxseSB0aGUgb3V0cHV0IG9mIEJ1Y2sx
IGFuZCBCdWNrMiBhcmUgY29ubmVjdGVkIHRvZ2V0aGVyLCBzbyB0aGV5IAo+IHNob3VsZCBhbHdh
eXMgYmUgY29uZmlndXJlZCB3aXRoIHRoZSBzYW1lIG91dHB1dCB2b2x0YWdlLiBBbmQgYm90aCAK
PiBjbHVzdGVycyBzaG91bGQgYmUgbWFwcGVkIHRvIGJvdGggb3V0cHV0cy4KCllvdSBhcmUgcmln
aHQsIEkgcmVjZWl2ZWQgdGhlIHNhbWUgcmVzcG9uc2UgZnJvbSB0aGUgb2ZmaWNpYWwgZGV2ZWxv
cGVycy4KClRoZXJlZm9yZSwgSSdtIHdvbmRlcmluZyBpZiBhbiBhZGRpdGlvbmFsIHJlZ3VsYXRv
ci1jb3VwbGVkLXdpdGg6IHByb3BlcnR5CmRlZmluaXRpb24gaXMgYWxzbyBuZWVkZWQgaGVyZT8K
Cj4KPiBJIGFsc28gd29uZGVyIHdoeSBpbiB0aGUgb3JpZ2luYWwgcGF0Y2ggdGhlIGJ1Y2sxIHJl
Z3VsYXRvciBpcyBuYW1lZCAKPiBidWNrMV8zdjQ1LCBmcm9tIHRoZSBzY2hlbWF0aWNzLCBpdCBz
aG91bGQgcmF0aGVyIGJlIGNhbGxlZCBidWNrMV8wdjkuCgpZZXMsIG15IGRlZmluaXRpb24gaGVy
ZSBpZ25vcmVzIHRoZSByZWd1bGF0b3IncyBkZWZhdWx0IHZvbHRhZ2UuClRoYW5rIHlvdSBmb3Ig
cG9pbnRpbmcgdGhpcyBvdXQuCgo+Cj4gUmVnYXJkcwo+IEF1cmVsaWVuCgotLSAKQmVzdCByZWdh
cmRzLApTaHV3ZWkgV3UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
