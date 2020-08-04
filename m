Return-Path: <SRS0=zqIG=BO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E2AC433DF
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2020 16:11:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 497D42086A
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2020 16:11:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ya42fOfG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 497D42086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A5fCvCST30CiOEyFL4Wpb5y+IzWZlQZHB30M7qSgrjA=; b=ya42fOfGHzzr+gVU1eSG4nMbi
	DJMNoMlpMXdhrVJAa00Frnrzkz8oLa/+5A36oRBLgAcPjmdHdCxCckcdUXcjOoKX/NkfWnRNewfQo
	i4uu+78Wi8FEZFs+1Me3zE4xcPXyPiTnU+mx50NJDMEEQMPapygEcVzNugP3dl82XQuP8D5iFbpUQ
	RqxlbZN0VZINbRKLGxACzdyaFurFZZqsHJ932dxrIcE2qgDljXjDqkEZJOZDOU6dBZvbUz9lZWiyf
	oZnwXLPmuwEtVt5it21X3ubFA9da5vZVpIQIW1M5+cn/tFSvuhnpDa5aFBfEK6aliYCp3HQI5JIJk
	vbZPKyZYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2zXS-0005lf-Nt; Tue, 04 Aug 2020 16:11:42 +0000
Received: from hera.aquilenet.fr ([185.233.100.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2zXQ-0005ks-FQ
 for linux-riscv@lists.infradead.org; Tue, 04 Aug 2020 16:11:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 8E93DE765;
 Tue,  4 Aug 2020 18:11:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sDQfZDMn0Rnd; Tue,  4 Aug 2020 18:11:36 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id D4671E2D2;
 Tue,  4 Aug 2020 18:11:36 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1k2zXL-0027ud-Um; Tue, 04 Aug 2020 18:11:35 +0200
Date: Tue, 4 Aug 2020 18:11:35 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] speakup: only build serialio when ISA is enabled
Message-ID: <20200804161135.pgwqbaahdtxhe7cq@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, speakup@linux-speakup.org
References: <20200804111332.dex7jobmabifdzw5@function>
 <20200804113413.GA181242@kroah.com>
 <20200804114951.ijs3hnezi4f64nll@function>
 <20200804115817.GC203147@kroah.com>
 <20200804153542.zowupa4ygdgxnciu@function>
 <20200804154952.GB495852@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804154952.GB495852@kroah.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_121140_622682_B1A6ED6C 
X-CRM114-Status: GOOD (  10.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, speakup@linux-speakup.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

R3JlZyBLSCwgbGUgbWFyLiAwNCBhb8O7dCAyMDIwIDE3OjQ5OjUyICswMjAwLCBhIGVjcml0Ogo+
ID4gI2RlZmluZSBpbmIoYykJCSh7IHU4ICBfX3Y7IF9faW9fcGJyKCk7IF9fdiA9IHJlYWRiX2Nw
dSgodm9pZCopKFBDSV9JT0JBU0UgKyAoYykpKTsgX19pb19wYXIoX192KTsgX192OyB9KQo+ID4g
Cj4gPiBhbmQgdGh1cyB5ZXMgaXQncyBhcml0aG1ldGljIG92ZXIgYSAodm9pZCopIHBvaW50ZXIs
IHRoZSBjYWxsZXIgY2Fubm90Cj4gPiBkbyBhbnl0aGluZyBhYm91dCBpdC4KPiAKPiBBbmQgdGhh
dCdzIGZpbmUsIG1hdGggd2l0aCBwb2ludGVycywgZXZlbiB2b2lkIG9uZXMsIGlzIG9rLgoKQysr
IGRvZXNuJ3QgbGlrZSBpdCwgYnV0IGluIGdlbmVyYWwgY29tcGlsZXJzIHByb3ZpZGUgc29tZSBz
ZW1hbnRpYyBmb3IKaXQsIHllcy4KCj4gSSB3b25kZXIgd2h5IHJpc2N2IHdhcyBjb21wbGFpbmlu
ZyBhYm91dCB0aGF0LiAgSXQncyBub3QgbmljZSwgYnV0IGl0IGlzCj4gdmFsaWQgQy4KClN0cmlj
dGx5IEMgc3BlYWtpbmcsIG5vLCBidXQgR05VIEMgeWVzLgoKPiBMZXQncyBzZWUgaWYgYW55IG9m
IHRoZWlyIGRldmVsb3BlcnMgY2FyZSBhYm91dCBpdCA6KQoKT2sgOikgSW4gdGhlIG1lYW53aGls
ZSBJIHNlbnQgYSB2MiBzZXJpZXMgdGhhdCBzaG91bGQgZml4IHRoZSBkaWZmZXJlbnQKbGluayBj
YXNlcywganVzdCBub3QgdGhlIHBhcnRpY3VsYXIgcmlzY3Ygd2FybmluZy4KClNhbXVlbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
