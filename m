Return-Path: <SRS0=mVee=RI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778E7C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 08:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47E6D2082C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2019 08:32:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dOU9Lw0/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47E6D2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=824HPFFN8+jcJgJ2NDPczhBdAwxxWPni+D8Q8/kR58A=; b=dOU9Lw0/QpsCqV
	sKLvQH0LPNaUOvYQ4P/vZsTZMm+n1cd5phgEeF5f/Cf5ehYRK7D4esic9/nBVN1KRwsLU3PQRuM0l
	ZbW7TomQOe1/Gwr5nGz/GrzUgA84F87sPmy4TqNl7l0F27knxS6ZTx4WjS2fDR9VV9RR1uLO1fJfh
	KYwgCLWctm8m2HzOwXyvJZjBS2HXn8OZ8twBtD1FH/cKt6Zq0I7WxBMIX91GfjgrtcvIHrV2+vMN2
	ba2t0qO0FEj6Acm58Ve4alqBkOO1E2eS+0mY0fwkcIsV7CUFhpAwrOWx49fcsIcluyI5kNKgdUvM1
	7Xod7yTAqeVzHuSy4sGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h15Ui-0007y6-1I; Tue, 05 Mar 2019 08:32:12 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h15Uf-0007xN-GK
 for linux-riscv@lists.infradead.org; Tue, 05 Mar 2019 08:32:11 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 796C2B034;
 Tue,  5 Mar 2019 08:32:07 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v8 0/2] PWM support for HiFive Unleashed
References: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
 <mvmfts228vu.fsf@suse.de>
 <CAJ2_jOE=8_c6aN2FTQVt0wTpBAkL8BYyF3UFaMmqdvWYWAAmvg@mail.gmail.com>
X-Yow: Either CONFESS now or we go to ``PEOPLE'S COURT''!!
Date: Tue, 05 Mar 2019 09:32:06 +0100
In-Reply-To: <CAJ2_jOE=8_c6aN2FTQVt0wTpBAkL8BYyF3UFaMmqdvWYWAAmvg@mail.gmail.com>
 (Yash Shah's message of "Tue, 5 Mar 2019 13:55:41 +0530")
Message-ID: <mvmlg1tzpq1.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_003209_686258_12AA4482 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTcOkciAwNSAyMDE5LCBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUuY29tPiB3cm90ZToK
Cj4gT24gTW9uLCBNYXIgNCwgMjAxOSBhdCA0OjM5IFBNIEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJA
c3VzZS5kZT4gd3JvdGU6Cj4+Cj4+IE9uIE3DpHIgMDEgMjAxOSwgWWFzaCBTaGFoIDx5YXNoLnNo
YWhAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+Cj4+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBhIFBX
TSBkcml2ZXIgYW5kIERUIGRvY3VtZW50YXRpb24KPj4gPiBmb3IgSGlGaXZlIFVubGVhc2hlZCBi
b2FyZC4gVGhlIHBhdGNoZXMgYXJlIG1vc3RseSBiYXNlZCBvbgo+PiA+IFdlc2xleSdzIHBhdGNo
Lgo+Pgo+PiBUaGF0IGRvZXNuJ3QgYXBwZWFyIHRvIHdvcmsgd2l0aCB0aGUgaGVhcnRiZWF0IHRy
aWdnZXIsIHRoZSBsZWQgZG9lc24ndAo+PiBmbGFzaC4KPgo+IE1ha2Ugc3VyZSB5b3UgbW9kaWZ5
IHRoZSBEVFMgZmlsZQoKV2hpY2ggRFRTIGZpbGU/CgpBbmRyZWFzLgoKLS0gCkFuZHJlYXMgU2No
d2FiLCBTVVNFIExhYnMsIHNjaHdhYkBzdXNlLmRlCkdQRyBLZXkgZmluZ2VycHJpbnQgPSAwMTk2
IEJBRDggMUNFOSAxOTcwIEY0QkUgIDE3NDggRTRENCA4OEUzIDBFRUEgQjlENwoiQW5kIG5vdyBm
b3Igc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
