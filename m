Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE0DCD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 16:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRUrzmwvZ8alaB/YxupYHpAYtUmiM4ZhyFHbYayd+ms=; b=fFtMXBVmH4e3hg
	OdScy5+j3SzHz4lfHNXeCaj9dfxdz7V/rtsS3rDU1RRO1F96TVLP6T0WYESUB+VH1nwybRK1pTGtd
	pOk5v//v0VEanCTi0W5mseCM0S+ImGhr0y8EaK9l26Bn/EEoIsgaTLxf7q6M/LmKv/UenOwYktyg/
	B8mzhH/wpy/60QH9yMn3BY/Zll2ui27KVO82he3ziLhb19CaIDACCCedv1ky7rig0st0PLqMNv7jH
	wot2ZPkUGfkEmzD4DAuSPK4tHCUTcM917rLff5e1Cch3zuBm0uXFvGf0sqBT/D5TFvXQOuddwLTuO
	rrQuu9wm7XOMGEocr3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjej-000000059Gg-3pB4;
	Wed, 20 May 2026 16:20:25 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjeh-000000059Eo-1k8T
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 16:20:24 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50d864c23bdso14261cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 09:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779294022; cv=none;
        d=google.com; s=arc-20240605;
        b=kuGccffMO2kHZhnoYGFwWep1riErSpDlFpbJzO2ExF5gYZhvdRMY5W1pl8ZsyZl8UA
         dp5UX29V4cCVxdK+pJHY6YLmIbnLjfXegCKDodjjSyIFoJbjD8LPyTfFiAZhOE7XzN7Z
         GnHTtYwli+Go8nVKAo7GLiam3uMUek8+wfXLUHCaaj2MAQEv393orZnZb16r0hDeKcBO
         Hq51F5pXXtxO9LKbphPuCAU48A6l6kW8ZnK1+ZlY4ZMW3sWKkyMgDPWOBp2DOFBIMyUn
         qedOfIjf00EX+C6UqoCNOheRVrY+/xrTy1ZuJmHxEi5rlzOtuNRRJ+JZ+nh6V+72k2fT
         1RmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=336SA/GYT1P2VucG2saRmHJSICv9pfFSfhTN5OgEmxw=;
        fh=68nx6UTnwl8X4bROWQEdRKZtcvFOQRUS21a0aNVCIYQ=;
        b=bbKZE8lkjFWLLenMD2PiXCWCJ9X+mDzdsgmMbgpE35TJMbNC0GsNTvIjwQZiw+BSa/
         EPVAMBrpLQH/PzguQFmGkGO/VATo9IyD/eGj8Genk3Ob7qWtzW4/gyhGD4vNmu+q081s
         HNCv7FMwaV2KoB/YUSvN0rbz8N8tg8LtTizyPv2Dg80xu/jpjHfB8n0qs4Bp38lrW4pO
         a6s93p0m1KeZCRE/oHDSLBl5D8gbn/UMRorKPPMfVBiL4/uyQN3m9+gZlko9P3ffgQ7p
         FVwXwdUHfNXoxRdefeQWF+JArD7g4UbyvJiiIuRjG1c/TYApO7KwzGjW8FkEEdoh2qZo
         4/Ww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779294022; x=1779898822; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=336SA/GYT1P2VucG2saRmHJSICv9pfFSfhTN5OgEmxw=;
        b=drVULLYmLuxOJ6pBD+XCT++XAc07vyx7n8eA2chr/8z0UpOV22NLNB7IpeFYIrXf+6
         1/4cqVXWfocaaWswPxELaiWJtAPlHhKFg7nph7eIh/noNUqZ1Aay8z6jRGRvViP3IsJr
         4rpcbgaGsXZzZ+HHOGqXEoNrotlHphC6lVN3MFYJVu1Vda3PJ+WJPN518bzLky288WrJ
         Vor8ZalDCQEBs+uhL+ZNkjizKkk49amgtYIdJB5B+yn33VYWX4gCCqndCGTxdH50d96d
         cNYfTb89uNPcvfYF53OH8m1jW97TYHy+D1ELYXAqDqHf56W50qKjiCOW7J2tDPF5lAs5
         MoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294022; x=1779898822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=336SA/GYT1P2VucG2saRmHJSICv9pfFSfhTN5OgEmxw=;
        b=LbhlkLzpUmVg0nu2uvUozo2ednHXptrsmXCli/jXNlD467KJqj/vivHNQxwvmJt4cf
         KTxt/wvFLNTtWsiHIH7hFGHi/5oU3whVw69jHZxKtSXs4IZhutkaXSTmN+ZmE+T/Ix+g
         MOKBBkundTFlmpHKX43gJn2FGB1KBR0Rnk85FTvU5dp7gnyltSWnJ5/sa6Dxi77HLbJG
         NlqaT30waskZT5+QUAGY3YhpFz08TtKjZ9/+/TqfuURUl0qogR4zDh7TwkRi/s9ARD+x
         YH5Aik10XtVhuu+t+O3+S4PbCussISUAyYNHif6oTR3V5svSbJh//8YslV7t8k/IxvgV
         4s8w==
X-Forwarded-Encrypted: i=1; AFNElJ8NhLfBJMUIP2+gq+4FsmJI5ZL3ao/lUCLc3gmfFO/q261Bd4ppXyLEbj2xwHZMH00Tgrb/fyhTkGU6Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwA4avRpvPTVkl18WhzQrpTsRsKagp2s/zqm80Z7hY2ZHniHHM
	qQ1xn/Y7mE4yAXlUV1bbcH3Mbf59AOFJ+EK4U/+ljc6riHGsyCSRFaluRmuf05GLxGOiwscXI4i
	iiVZ4uSIOfp5xz2SXfGYST81dZ3mpCWJGps1c+1kg
X-Gm-Gg: Acq92OFYfpezcfqCNLK5Veg/FD+3UX+3PiuzcCL6Iz/3eaDQW0KRi1M05pbBAAP5FAI
	fKphWUwc93AkuBAS7Zyt0tZvb+znN87ta7JEN5I1ZbZPvPVKnlzVJklKVC65Bc9wtokL40bmJQn
	FdBraC7No7paVUC3O5STTgRd8SuSexydyQrSKpv0Dpbm0ZG6OyVN19CqM311iy/a1iwhcQ/hCnB
	Cd7SubDthOL5fSy4iE47tO7/jv/VlE0zHrH/yPt4VQah4TuasXGyqHTKSsKMpJfeAQU+E+gg1DR
	eegjpOkXoZfIJXwOwdBvF0L8fBU=
X-Received: by 2002:a05:622a:1ba1:b0:514:c25e:c164 with SMTP id
 d75a77b69052e-5167937f1bemr20762781cf.10.1779294021124; Wed, 20 May 2026
 09:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer> <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <agxbq1TxJdniMQT3@lucifer> <CAGsJ_4zxyZP_xkFCGWfLyXkqomrX6DNqyMVirk=aggtwB1zExw@mail.gmail.com>
 <ag1mk2DSJsiORaxK@lucifer> <CAGsJ_4zN5ezh9vvvQDQdMF2KuuDGvkhNjTZWc0y0Lsa-P4Aahw@mail.gmail.com>
In-Reply-To: <CAGsJ_4zN5ezh9vvvQDQdMF2KuuDGvkhNjTZWc0y0Lsa-P4Aahw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 20 May 2026 09:20:09 -0700
X-Gm-Features: AVHnY4LoOxiQoJQwfyBuM7QQXQEEIIq-qCobTd7La33Msde42KTqBRrMiQ1PsG0
Message-ID: <CAJuCfpHbKHjktnucBNAuRDSasHiZfFDP6xgz2dX86dX1VaJYzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, 
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, 
	bhe@redhat.com, youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_092023_505337_AB30358B 
X-CRM114-Status: GOOD (  43.86  )
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMjowN+KAr0FNIEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDIwLCAyMDI2IGF0IDM6NTDigK9QTSBMb3Jl
bnpvIFN0b2FrZXMgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIE1heSAy
MCwgMjAyNiBhdCAwNToxODo1MkFNICswODAwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4gPiBPbiBU
dWUsIE1heSAxOSwgMjAyNiBhdCA4OjUz4oCvUE0gTG9yZW56byBTdG9ha2VzIDxsanNAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIE1heSAxOCwgMjAyNiBhdCAxMjo1
Njo1OVBNIC0wNzAwLCBTdXJlbiBCYWdoZGFzYXJ5YW4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gSSB0aGluayB3ZSBlaXRoZXIgbmVlZCB0byBmaXggYGZvcmsoKWAsIG9y
IGtlZXAgdGhlIGN1cnJlbnQKPiA+ID4gPiA+ID4gYmVoYXZpb3Igb2YgZHJvcHBpbmcgdGhlIFZN
QSBsb2NrIGJlZm9yZSBwZXJmb3JtaW5nIEkvTy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHNlZS4g
U28sIHRoaXMgcHJvYmxlbSBhcmlzZXMgZnJvbSB0aGUgZmFjdCB0aGF0IHdlIGFyZSBjaGFuZ2lu
ZyB0aGUKPiA+ID4gPiA+IHBhZ2VmYXVsdHMgcmVxdWlyaW5nIEkvTyBvcGVyYXRpb24gdG8gaG9s
ZCBWTUEgbG9jay4uLgo+ID4gPiA+ID4gQW5kIHlvdSB3YW50IHRvIGxvY2sgVk1BIG9uIGZvcmsg
b25seSBpZiB2bWFfaXNfYW5vbnltb3VzKHZtYSkgfHwKPiA+ID4gPiA+IGlzX2Nvd19tYXBwaW5n
KHZtYS0+dm1fZmxhZ3MpLiBTbywgd2Ugd2lsbCBiZSBibG9ja2luZyBwYWdlIGZhdWx0cyBmb3IK
PiA+ID4gPiA+IGFub255bW91cyBhbmQgQ09XIFZNQXMgb25seSB3aGlsZSBob2xkaW5nIG1tYXBf
d3JpdGVfbG9jaywgcHJldmVudGluZwo+ID4gPiA+ID4gYW55IFZNQSBtb2RpZmljYXRpb24uIE9u
IHRoZSBzdXJmYWNlLCB0aGF0IGxvb2tzIG9rIHRvIG1lIGJ1dCBJIG1pZ2h0Cj4gPiA+ID4gPiBi
ZSBtaXNzaW5nIHNvbWUgY29ybmVyIGNhc2VzLiBJZiBub2JvZHkgc2VlcyBhbnkgb2J2aW91cyBp
c3N1ZXMsIEkKPiA+ID4gPiA+IHRoaW5rIGl0J3Mgd29ydGggYSB0cnkuCj4gPiA+ID4KPiA+ID4g
PiBOb3Qgc3VyZSBpZiB5b3Ugbm90aWNlZCBidXQgSSBkaWQgcmFpc2UgY29uY2VybnMgOykKPiA+
ID4gPgo+ID4gPiA+IEkgd29uZGVyIGlmIHlvdSd2ZSBjb25mdXNlZCB0aGUgZmF1bHQgcGF0aCBh
bmQgZm9yayBoZXJlLCBhcyBJIHRoaW5rIEJhcnJ5IGhhcwo+ID4gPiA+IGJlZW4gYSBsaXR0bGUg
dW5jbGVhciBvbiB0aGF0Lgo+ID4gPgo+ID4gPiBJIHRoaW5rIEnigJl2ZSBiZWVuIGFic29sdXRl
bHkgY2xlYXIgOi0pCj4gPgo+ID4gT24gdGhpcyBwb2ludCBzdXJlLCBJIHdvdWxkIGFyZ3VlIGxl
c3Mgc28gYXJvdW5kIHRoZSBmb3JrIHN0dWZmIGJ1dCBJIHJlc3BvbmRlZAo+ID4gb24gdGhhdCBz
cGVjaWZpY2FsbHkgZWxzZXdoZXJlIHNvIGxldCdzIGtlZXAgdGhpbmdzIG1vdmluZyA6PikKPiA+
Cj4gPiA+IFdlIHNob3VsZCBlaXRoZXIgc3RpY2sgdG8gdGhlIGN1cnJlbnQgYmVoYXZpb3IgLSBk
cm9wCj4gPiA+IHRoZSBWTUEgbG9jayBiZWZvcmUgZG9pbmcgSS9PLCBvciBjaGFuZ2UgZm9yaygp
IHNvIHRoYXQgaXQKPiA+ID4gZG9lcyBub3Qgd2FpdCBvbiB2bWFfc3RhcnRfd3JpdGUoKS4KPiA+
Cj4gPiBBZ2FpbiwgYXMgSSBzYWlkIGVsc2V3aGVyZSwgSSB0aGluayB0aGVyZSBtaWdodCBiZSBh
IDNyZCB3YXkgcG9zc2libHkuIEl0J3MgYQo+ID4gYmlnIG1pc3Rha2UgdG8gYXNzdW1lIHRoYXQg
dGhlcmUgYXJlIG9ubHkgc3BlY2lmaWMgc29sdXRpb25zIHRvIHByb2JsZW1zIGluIHRoZQo+ID4g
a2VybmVsIHRoZW4gdG8gcHJlc2VudCBhIGZhbHNlIGRpY2hvdG9teS4KPgo+IEkgcmVjYWxsZWQg
dGhhdCB3aGVuIHdlIGRpc2N1c3NlZCB0aGlzIHBhcnQgaW4gbXkgc2xpZGVzOgo+Cj4g4oCYRm9y
IHNpbXBsaWNpdHksIHJhdGhlciB0aGFuIHVzaW5nIGEgd2hpdGVsaXN0IG1lY2hhbmlzbSBmb3IK
PiBwZXItVk1BIHJldHJ5LCB3ZSBjb3VsZCB1c2UgYSBibGFja2xpc3QgaW5zdGVhZDogZGVmYXVs
dCB0bwo+IGFsd2F5cyByZXRyeSB2aWEgdGhlIFZNQSBsb2NrLCBhbmQgb25seSBhbGxvdyBtbWFw
X2xvY2stYmFzZWQKPiBwYWdlLWZhdWx0IHJldHJ5IGZvciBzcGVjaWZpYyBjYXNlcyBzdWNoIGFz
Cj4gX192bWZfYW5vbl9wcmVwYXJlKCku4oCZCj4KPiBTdXJlbiBtZW50aW9uZWQgaW50cm9kdWNp
bmcgYSBGQUxMQkFDSyBmbGFnLiBXaXRoIHRoZQo+IEZBTExCQUNLIGZsYWcsIHdlIHdvdWxkIHJl
dHJ5IHZpYSBtbWFwX2xvY2s7IHdpdGggdGhlIFJFVFJZCj4gZmxhZywgd2Ugd291bGQgcmV0cnkg
dmlhIHRoZSBWTUEgbG9jay4KPgo+IE5vdCBzdXJlIHdoZXRoZXIgdGhpcyBjb3VsZCByZWFsbHkg
YmUgY2FsbGVkIGEg4oCYdGhpcmQgd2F5LOKAmQo+IGJ1dCBpdCBzZWVtcyBtb3JlIGxpa2UgYSBz
aGlmdCBmcm9tIGEgd2hpdGVsaXN0IG1vZGVsIHRvIGEKPiBibGFja2xpc3QgbW9kZWwsIHdpdGhv
dXQgY2hhbmdpbmcgdGhlIGZ1bmRhbWVudGFsIGRlc2lnbiwgYnV0Cj4gaXQgZG9lcyBjaGFuZ2Ug
d2hlcmUgd2Ugd291bGQgbmVlZCB0byB0b3VjaCB0aGUgc291cmNlIGNvZGUuCgpJIHRob3VnaHQg
dGhlIGNvbmNsdXNpb24gb2YgdGhlIExTRk1NIGRpc2N1c3Npb24gd2FzIHRoYXQgdGhpcyBpcyB0
aGUKZGlyZWN0aW9uIHdlIHdvdWxkIHRha2UuIE1heWJlIHRoZXJlIHdlcmUgZm9sbG93dXAgZGlz
Y3Vzc2lvbnMgd2hpY2ggSQptaXNzZWQ/ClRoaXMgYXBwcm9hY2ggc3RpbGwgZHJvcHMgdGhlIGxv
Y2sgYmVmb3JlIEkvTyBidXQgYWZ0ZXIgSS9PIGNvbXBsZXRpb24KaXQgcmVhY3F1aXJlcyB0aGUg
c2FtZSBwZXItVk1BIGxvY2sgaW5zdGVhZCBvZiBmYWxsaW5nIGJhY2sgdG8KbW1hcF9sb2NrLiBJ
TU8gaXQncyB0aGUgc2ltcGxlc3QgZml4IGZvciB0aGUgaXNzdWUgeW91IGJyb3VnaHQgdXAuCgo+
Cj4gPgo+ID4gV2UgYWJzb2x1dGVseSBoZWFyIHlvdSBvbiB0aGlzIGJlaW5nIGEgcHJvYmxlbSBh
bmQgaXQgV0lMTCBiZSBhZGRyZXNzZWQgb25lIHdheQo+ID4gb3IgYW5vdGhlci4KPgo+IFRoYW5r
cy4gVGhpcyBpcyBhIGJpdCBvZiBsaWdodCBpbiB3aGF0IGhhcyBmZWx0IGxpa2UgYSBmYWlybHkK
PiBkYXJrIHNpdHVhdGlvbi4gSSByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIHRob3VnaHRmdWwgYW5k
Cj4gcmVzcG9uc2libGUgYXBwcm9hY2guCj4KPiA+Cj4gPiBPZiB0aGUgdHdvIGFwcHJvYWNoZXMs
IGFzIEkgc2FpZCBlbHNld2hlcmUsIEkgcHJlZmVyIHdoYXQgeW91J3ZlIGRvbmUgaW4gdGhpcwo+
ID4gc2VyaWVzIHRvIGFueXRoaW5nIHRvdWNoaW5nIGZvcmsuCj4gPgo+ID4gQnV0IGdpdmUgbWUg
dGltZSB0byBsb29rIHRocm91Z2ggdGhlIHNlcmllcyBwbGVhc2UgKEknZCBhbHNvIHN1Z2dlc3Qg
UkZDJ2luZwo+ID4gd2hlbiBpdCdzIHNvbWV0aGluZyBraW5kYSBmdW5kYW1lbnRhbCB0aGF0IG1p
Z2h0IGdlbmVyYXRlIGNvbnZlcmFzdGlvbiwgbWFrZXMKPiA+IGxpZmUgYSBiaXQgZWFzaWVyIG9u
IHRoZSByZXZpZXcgc2lkZSA6KQo+Cj4gVGhhbmtzISBTdXJlLCBJ4oCZbSBoYXBweSB0byB3YWl0
IGFuZCB0aGVyZeKAmXMgbm8gdXJnZW5jeS4KPgo+IExhc3QgeWVhciB5b3UgbWFkZSBxdWl0ZSBh
IHNpZ25pZmljYW50IGNvbnRyaWJ1dGlvbiB0byB0aGUgd29yawo+IHdoZW4gSSB0cmllZCB0byBy
ZW1vdmUgbW1hcF9sb2NrIGluIG1hZHZpc2UuIEkgcmVhbGx5Cj4gYXBwcmVjaWF0ZWQgaXQuIE5v
dyB3ZeKAmXJlIGJhY2sgdG8gdGhlIHNhbWUgbG9jayBhZ2FpbiwganVzdCBpbgo+IGRpZmZlcmVu
dCBwbGFjZXMuCj4KPiBCZXN0IFJlZ2FyZHMKPiBCYXJyeQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
