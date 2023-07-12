Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00B7EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 02:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+EbwUG+OSwJJ9SZMG373FC+3bm3MgrUr0ly22VwvQM=; b=UIc7/Raz9B6/03
	E1ZlOQ//P+M4m5q+c/aVcY8yshAj6lScg+PgGJkJ5hloAlxwtlW857pjcUVKZdbPgp9y8HUNXQYL7
	Yhmvxq/Kxu12OE7MsmBKWNdkeb/QNoaMpp4ZVhU5NHP3Wf7HU6XfIh0NQwyto8003GsqzSRTTrueq
	/zKRLu5GtNAhMOvYM5DyDuDtU5UXJGSvfxk4Nr829PYnjTcpazBiDgySVnsy4jy0UmB6VevHFJQ+6
	cLPqql8JTVZdbbWXgp5OZDTdUlKINlvNnxzsiq74X437WaYFHdzbtOB+mG3xkc+EsrrdWHlVlROcu
	9P5iW7WeVeIVJqf6Zlvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJQ16-00GKAa-2R;
	Wed, 12 Jul 2023 02:55:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJQ15-00GK9a-0D
	for linux-riscv@bombadil.infradead.org;
	Wed, 12 Jul 2023 02:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AywlaY7x3Z/gX6am2crBJ9gOzJzowq37abxtBtmocQo=; b=cXZ+gVAsGuMLoE7yB6JRBB1nz8
	ybsrl2bTd2rU3H1CDpSffyNDHmb+4zgldRK0ff+EdKpD/xXlNpa1acoI4Jdgw/0r5RPw7bO+10AUX
	r9m6UHKWwormdsXVHYHISkjjwdBQHcuX+9kHcNB+ydDyu4SFm7A2AyRjIML5OHF+9IWngSZ7a+FS4
	rdOvmHZ5LnJdtRkHXylrhuBG5xvnti4xKxcGJnw6/9fyB4i1rNK3kaDPHtUGedKEKILPP2pSmNenL
	kbTW+HOl5WR7QVPyoExZIF3byfp5K7XB+4nGcvK05wXbCgd8bNgvPg071EssJ8ZEOAJeUlSv1T5Bp
	lBw3qeSg==;
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJNkA-002YID-2m
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 00:30:13 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a1ebb79579so4784328b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 17:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689121804; x=1691713804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AywlaY7x3Z/gX6am2crBJ9gOzJzowq37abxtBtmocQo=;
        b=ghdEvDcr1IFDaQljt1dRUmu0HvE8cBRXow9dvmJIaaoVnpliy0H6io9/6jVjgOiCvp
         W8ARD6eHNeqfJ+cDPA0NJgPJBqbJKcZVgnHyOUyjNKE8bjkztkk4ySHLSiUBAuECvNvG
         mb/2DywJzkaoQruchWfaALw0QTZyIhkyMl6GdGEbXU96lEG1IIKslGtkOxNFHbPJlukV
         cU3AAipN+IhHQaj7foFoecZ/dEzkn+h7hzibqavkPSnM3iQjwT1oNRd+xdvy8XXbjmLV
         /C6WF+gR5Z+E29WVX3/x1rDq3OotadtwPkAl2sIQPRWVXcg0mMjVQCSxr6vu04KG1I6/
         7Mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689121804; x=1691713804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AywlaY7x3Z/gX6am2crBJ9gOzJzowq37abxtBtmocQo=;
        b=lZbJQ2HargHKjXiGBFMwBQRt6iReVIzLr8An311IBgDtLDd1ke60oAlpsF/0PNC8ix
         a92FN3w7lWvKF41u0r3uAtCqi8L5DgS3WivC7D1MHGHKGPAT6kGBTeWQME7sMN8ESnRW
         8t6X0dDUce4Ejk/MNJMQxsaIWu0BhMpdufj5uYYFNcQt7CdbUPlUnWx6tCObzVUKjP3y
         GR5Fr1UghGLAeL0yHH8c6JDLSyIpbpl6uJ9y+vtpiVHRhJnCKhhZfN5o7AXHHj6y369F
         kNYePDZm5u4pEFaVvNuJdzmUJJCU1xOpodzwrjF88sN0Rz3JutwvMMTXm13/8QL/1pHP
         2pvw==
X-Gm-Message-State: ABy/qLaUIyDwRff++D4v+Cn2NMwlDn6qMexsr7EiRnT1eZT2he5tGWPl
	6W5MyAwGTdW1OYpRXSR53Q2Dttj68SRJwA==
X-Google-Smtp-Source: APBJJlERzXloivjI5bk3/nTAyrXULoGFQYQ9HeldnM+GEDq5PgIauvtfIOYiM1H16bglc4CH0JAn3w==
X-Received: by 2002:a05:6808:1aa6:b0:3a3:78dc:8c4c with SMTP id bm38-20020a0568081aa600b003a378dc8c4cmr15877789oib.46.1689121804077;
        Tue, 11 Jul 2023 17:30:04 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:9374])
        by smtp.gmail.com with ESMTPSA id s10-20020a62e70a000000b006687b41c4dasm2285401pfh.110.2023.07.11.17.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 17:30:03 -0700 (PDT)
Date: Tue, 11 Jul 2023 14:30:01 -1000
From: Tejun Heo <tj@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	kernel-team@meta.com, Linux PM list <linux-pm@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	linux-rtc@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	netdev <netdev@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <ZK30CR196rs-OWLq@slm.duckdns.org>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_013011_198844_604A0104 
X-CRM114-Status: GOOD (  14.42  )
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

T24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMTE6Mzk6MTdBTSAtMTAwMCwgVGVqdW4gSGVvIHdyb3Rl
Ogo+IE9uIFR1ZSwgSnVsIDExLCAyMDIzIGF0IDA0OjA2OjIyUE0gKzAyMDAsIEdlZXJ0IFV5dHRl
cmhvZXZlbiB3cm90ZToKPiA+IE9uIFR1ZSwgSnVsIDExLCAyMDIzIGF0IDM6NTXigK9QTSBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKLi4uCj4gPiB3b3Jr
cXVldWU6IG5laWdoX21hbmFnZWRfd29yayBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyA0IHRpbWVz
LAo+ID4gY29uc2lkZXIgc3dpdGNoaW5nIHRvIFdRX1VOQk9VTkQKPiAKPiBJIHdvbmRlciB3aGV0
aGVyIHRoZSByaWdodCB0aGluZyB0byBkbyBoZXJlIGlzIHNvbWVob3cgc2NhbGluZyB0aGUgdGhy
ZXNob2xkCj4gYWNjb3JkaW5nIHRvIHRoZSByZWxhdGl2ZSBwcm9jZXNzaW5nIHBvd2VyLiBJdCdz
IGRpZmZpY3VsdCB0byBjb21lIHVwIHdpdGggYQo+IHRocmVzaG9sZCB3aGljaCB3b3JrcyB3ZWxs
IGFjcm9zcyB0aGUgbGF0ZXN0ICYgZmFzdGVzdCBhbmQgcmVhbGx5IHRpbnkgQ1BVcy4KPiBJJ2xs
IHRoaW5rIGFib3V0IGl0IHNvbWUgbW9yZSBidXQgaWYgeW91IGhhdmUgc29tZSBpZGVhcywgcGxl
YXNlIGZlZWwgZnJlZQo+IHRvIHN1Z2dlc3QuCgpHZWVydCwgZG8geW91IG1pbmQgcG9zdGluZyB0
aGUgZnVsbCBrZXJuZWwgbG9ncyBmb3IgdGhlIGFmZmVjdGVkIG1hY2hpbmVzPwoKVGhhbmtzLgoK
LS0gCnRlanVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
