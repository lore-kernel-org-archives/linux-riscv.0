Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C69C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NRPGb2+p5hiADvKL+7JswRKJxrTrVozpMGAMoRxEu4=; b=Xw3TDhWUPltLQE
	gVMFo3wfYagJ4bNKBhhYfNtYRASvpiKjWgYWekF56lT9dQ4yjWWGlwvC5Spubt8nyfgvTVu/zz9dj
	s0tbvmPysDsSFzvgc4tlIhaaeqqCvpPTUC+VjaIxkZ/OLi6/Wtsn9PXYpA+7vNF+rBwRNDW54Uouq
	9US9cVFgeG9t0n4XKX0wrpFrGwg87SOm+9Rxrnh07dfNanrhmGP8qx9qgR+LpylnZKCoQWloEr6YI
	C9PuuH/P3FfBx8PUlkqgLlnB/B2biiF/yADhcg5D67rela8N6sr355xd15O/jvO6IfXDYh0RPY1ss
	ZiXALI1g8Db1NQME9Wxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASMs-00000008i4v-1A9Y;
	Fri, 24 May 2024 10:41:46 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sASMo-00000008i3v-0nHW
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 10:41:44 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-df7722171bcso798336276.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716547299; x=1717152099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXTrajnU7to/8Kkx0kFyODWqZ7ULlok1jwgmE99WXAc=;
        b=m1qyi59pyszaFv6u6+gtEpItAMqPeduCGCFTQTTGs45wkKlBnOfU0wA/eYAXIGg+qd
         mZWi3nDl5oj0TqbsIy4HbnlfuVuCOONtfDIaQYVCEXqPEdOdbdpWrqJGlvvDXUfJM1QH
         MAFS105RBnPimiHtVQPpbl4BcEvpgdJJ5n9DwqAY5tg/oQ9pnWSwoxa7LXXvdFOWuv9E
         RFnGRFnsPATTdbWWKPlIiq259bGo9NxHH8Kf+9OAhF25US7xYZ1I+3R6SUz3Oj04n8ub
         q+Vizexzb2+xG1zqmiXyFqQm/jIAIG061kBO7vb/Jvy7ybK7yk4H3u2zLJ7ZGu9IZKBe
         B5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716547299; x=1717152099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXTrajnU7to/8Kkx0kFyODWqZ7ULlok1jwgmE99WXAc=;
        b=V2o67DFa9EwJUNwblMSGP3ZirSd7a93sFTphEbTK3aWPXgm6KeERQY1G3/MCIa9Ub4
         wcrpmukRd9B+KLojf9Y20C0pFfWs4V20GJvmitH20FzmWnfMOq3qGnD2rFaTKeDAmA0B
         vS6RW4JgoZqBp5RKyGlaUVRo9hVUsH9Ws+sEhh1x1MgPHLfgZvCUd9KB1mDW6Sw5QbWR
         6RiDJbRH+SZ83HfJdSPbas7voS1hqJtmC/+0lNUoXQ2Yn1UQQnhEwoHuZu4Y3EOoHHXa
         U4ZDCCv/q1C7hVhJaYaVoXV4ddhtXqiWWgddOdJfWH3EdnQRAtVrJlLTi2JGXOMwMuAs
         Jgmg==
X-Forwarded-Encrypted: i=1; AJvYcCWUTBYuvMG3yzlWlpFSlKosbGYLWTzmtZX9P14zGRFw8cyU+MtNrxD4gNouFl/8q6OOBzgTOWNAPwx/MCHUEORBuC2gj4h+PCUbBV3TmK9q
X-Gm-Message-State: AOJu0YznSoADfxsebs4TVsMnf5e2j70oTohcoTOH7thz1qYtZ8v3sDh8
	PE0Jtig07ovQeGlyjeOMDTCu2ysXllSnPiyVyNyBsvYKI9VdkKyvX+qg37m8Kqy33LYRntSdjsr
	AwX8Vm9SBa3lxHUE4e701PAHKY83cGHqB9a3TjQ==
X-Google-Smtp-Source: AGHT+IEPSpGVjqat8T+RvfksZYTyFP+HqIfWNgQJAU+a4NitDODiB8ZAXvb2En7cAUR5yVuO4qWc2l+8kTvUGGtyN0Q=
X-Received: by 2002:a05:6902:c0d:b0:df4:8ab4:d8bf with SMTP id
 3f1490d57ef6-df7721a50b6mr1984616276.33.1716547299257; Fri, 24 May 2024
 03:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240226065113.1690534-1-nick.hu@sifive.com> <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
 <CAKddAkDcdaXKzpcKN=LCCx9S4Trv+joLX2s=nyhzaRtM5HorqA@mail.gmail.com>
 <CAKddAkC6N=Cfo0z+F8herKTuJzCyt_MA0vWNbLCr6CbQnj0y8g@mail.gmail.com>
 <CAPDyKFr_M0NDH0gaunBpybnALOFfz4LpX4_JW2GCUxjwGzdZsg@mail.gmail.com>
 <CAKddAkC5CRX+ZTh=MgzPYU72SY13+AQYhknhV_CC+=XX9=DKyg@mail.gmail.com>
 <CAAhSdy1SDd=VUqDQA0T5n9LwHo=3uGzFq1dUcbDFcB3aBdaioA@mail.gmail.com>
 <CAAhSdy33DcNw+pbDRrR=hBH86kwvu3xZbomQby8XhRXcc-exqQ@mail.gmail.com>
 <CAKddAkBrP2iQBC+aY1Xw5pssBpiQZe4V-6ww5m8hbKP6V0jzLg@mail.gmail.com>
 <CAAhSdy12-_Hdb-WVrs8kyfCy_OQA0p27DS6TOV87dh9HODrU_Q@mail.gmail.com>
 <CAKddAkCQOvnci-bzKx1pBUJh5t1uPT-wNXGH1WyqDyb5qR_Scg@mail.gmail.com> <CAK9=C2V2xYwi4wK2+e=z7NF8Ph7+LxvWh4J4TmQrbVfSfpO-Ag@mail.gmail.com>
In-Reply-To: <CAK9=C2V2xYwi4wK2+e=z7NF8Ph7+LxvWh4J4TmQrbVfSfpO-Ag@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 24 May 2024 12:41:03 +0200
Message-ID: <CAPDyKFo6PiWmwtHTfRCWK95RgQShfuR+G2cZm0D1Ad-at_MWmg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
To: Anup Patel <apatel@ventanamicro.com>, Nick Hu <nick.hu@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, palmer@dabbelt.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, paul.walmsley@sifive.com, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, Cyan Yang <cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_034142_269020_592E105F 
X-CRM114-Status: GOOD (  36.68  )
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

T24gRnJpLCAxNyBNYXkgMjAyNCBhdCAwNjozOSwgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFt
aWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMTYsIDIwMjQgYXQgOTo0MOKAr0FNIE5p
Y2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgQW51cAo+ID4KPiA+
IE9uIFdlZCwgTWF5IDE1LCAyMDI0IGF0IDk6NDbigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgTmljaywKPiA+ID4KPiA+ID4gT24gV2Vk
LCBNYXkgMTUsIDIwMjQgYXQgNTo0NeKAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4g
d3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBIaSBBbnVwLAo+ID4gPiA+Cj4gPiA+ID4gVGhhbmsgeW91
IGZvciB5b3VyIGd1aWRhbmNlLgo+ID4gPiA+IEFmdGVyIGVuYWJsaW5nIHRoZSBkZWJ1ZyBtZXNz
YWdlLCB3ZSBmb3VuZCBhIHdheSB0byBzb2x2ZSB0aGUgcHJvYmxlbQo+ID4gPiA+IGJ5IHRoZSBm
b2xsb3dpbmcgc3RlcHM6Cj4gPiA+ID4gMS4gQWRkIGEgY29tcGF0aWJsZSBzdHJpbmcgaW4gJ3Bv
d2VyLWRvbWFpbnMnIG5vZGUgb3RoZXJ3aXNlIGl0IHdvbid0Cj4gPiA+ID4gYmUgdGhlIHN1cHBs
aWVyIG9mIHRoZSBjb25zdW1lcnMuIChTZWUgb2ZfbGlua190b19waGFuZGxlKCkpCj4gPiA+Cj4g
PiA+IEhtbSwgcmVxdWlyaW5nIGEgY29tcGF0aWJsZSBzdHJpbmcgaXMgb2RkLiBXaGVyZSBzaG91
bGQgd2UgZG9jdW1lbnQKPiA+ID4gdGhpcyBjb21wYXRpYmxlIHN0cmluZyA/Cj4gPiA+Cj4gPiBT
b3JyeSwgdGhpcyBpcyBteSBmYXVsdC4gSSBkaWRuJ3QgaW5jbHVkZSBzb21lIHVwZGF0ZXMgaW4K
PiA+IG9mX2xpbmtfdG9fcGhhbmRsZSgpLiBUaGlzIGxlZCBzb21lIG1pc3VuZGVyc3RhbmRpbmdz
IGhlcmUuCj4gPiBZb3UgYXJlIHJpZ2h0LCB3ZSBkb24ndCBuZWVkIGl0Lgo+ID4gVGhlIHN1cHBs
aWVyIHdpbGwgYmUgbGlua2VkIHRvIHRoZSBDTFVTVEVSX1BEIG5vZGUuCj4gPgo+ID4gPiA+IDIu
IE1vdmUgdGhlICdwb3dlci1kb21haW5zJyBub2RlIG91dHNpZGUgdGhlICdjcHVzJyBub2RlIG90
aGVyd2lzZSBpdAo+ID4gPiA+IHdvbid0IGJlIGFkZGVkIHRvIHRoZSBkZXZpY2UgaGllcmFyY2h5
IGJ5IGRldmljZV9hZGQoKS4KPiA+ID4gPiAzLiBVcGRhdGUgdGhlIGNwdWlkbGUtcmlzY3Ytc2Jp
IGRyaXZlciB0byBnZXQgdGhlIHBkc19ub2RlIGZyb20KPiA+ID4gPiAnL3Bvd2VyLWRvbWFpbnMn
Lgo+ID4gPgo+ID4gPiBCeSBhZGRpbmcgYSBjb21wYXRpYmxlIHN0cmluZyBhbmQgbW92aW5nIHRo
ZSAicG93ZXItZG9tYWlucyIgbm9kZQo+ID4gPiBvdXRzaWRlLCB5b3UgYXJlIHNpbXBseSBmb3Jj
aW5nIHRoZSBPRiBmcmFtZXdvcmsgdG8gcG9wdWxhdGUgZGV2aWNlcy4KPiA+ID4KPiA+ID4gSG93
IGFib3V0IG1hbnVhbGx5IGNyZWF0aW5nIHBsYXRmb3JtX2RldmljZSBmb3IgZWFjaCBwb3dlci1k
b21haW4KPiA+ID4gRFQgbm9kZSB1c2luZyBvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlKCkgaW4g
c2JpX3BkX2luaXQoKSA/Cj4gPiA+Cj4gPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uISBXZSBo
YXZlIHRlc3QgdGhlIHNvbHV0aW9uIGFuZCBpdCBjb3VsZCB3b3JrLgo+ID4gV2Ugd2FzIHdvbmRl
cmluZyBpZiBpdCdzIGZlYXNpYmxlIGZvciB1cyB0byByZWxvY2F0ZSB0aGUKPiA+ICdwb3dlci1k
b21haW5zJyBub2RlIG91dHNpZGUgb2YgdGhlIC9jcHVzPyBUaGUgQ0xVU1RFUl9QRCBtaWdodAo+
ID4gZW5jb21wYXNzIG5vdCBvbmx5IHRoZSBDUFVzIGJ1dCBhbHNvIG90aGVyIGNvbXBvbmVudHMg
d2l0aGluIHRoZQo+ID4gY2x1c3Rlci4KPgo+IFRoZSBjcHVpZGxlLXJpc2N2LXNiaSBkcml2ZXIg
ZXhwZWN0cyAicG93ZXItZG9tYWlucyIgRFQgbm9kZQo+IHVuZGVyICIvY3B1cyIgRFQgbm9kZSBi
ZWNhdXNlIHRoaXMgZHJpdmVyIG9ubHkgZGVhbHMgd2l0aCBwb3dlcgo+IGRvbWFpbnMgcmVsYXRl
ZCB0byBDUFUgY2x1c3RlciBvciBDUFUgY2FjaGUtaGllcmFyY2h5LiBJdCBkb2VzCj4gbWFrZSBz
ZW5zZSB0byBkZWZpbmUgTDIvTDMgcG93ZXIgZG9tYWlucyB1bmRlcgo+ICIvY3B1cy9wb3dlci1k
b21haW4iIHNpbmNlIHRoZXNlIGFyZSByZWxhdGVkIHRvIENQVXMuCj4KPiBNb3ZpbmcgdGhlIENQ
VSAicG93ZXItZG9tYWlucyIgRFQgbm9kZSBkaXJlY3RseSB1bmRlciAiLyIgb3IKPiBzb21ld2hl
cmUgZWxzZSB3b3VsZCBtZWFuIHRoYXQgaXQgY292ZXJzIHN5c3RlbS13aWRlIHBvd2VyCj4gZG9t
YWlucyB3aGljaCBpcyBub3QgdHJ1ZS4KCkkgdW5kZXJzdGFuZCB5b3VyIHBvaW50LCBidXQgSSBh
bSBub3QgY29udmluY2VkIHRoYXQgdGhlIHBvd2VyLWRvbWFpbnMKbmVlZCB0byBiZWxvbmcgdG8g
dGhlICJjcHVzIiBub2RlLiBJZGVhbGx5LCB0aGUgcG93ZXItZG9tYWluIGRlc2NyaWJlcwp0aGUg
cG93ZXItcmFpbCBhbmQgdGhlIGludGVyZmFjZSB0byBtYW5hZ2UgdGhlIENQVXMsIHRoaXMgY2Fu
IHN1cmVseQpiZSBkZXNjcmliZWQgb3V0c2lkZSB0aGUgImNwdXMiIG5vZGUgLSBldmVuIGlmIHRo
ZXJlIGFyZSBvbmx5IENQVXMKdGhhdCBhcmUgdXNpbmcgaXQuCgpNb3Jlb3ZlciwgbW92aW5nIGZv
cndhcmQsIG9uZSBzaG91bGQgbm90IGJlIHN1cnByaXNlZCBpZiBpdCB0dXJucyBvdXQKdGhhdCBh
IHBsYXRmb3JtIGhhcyBvdGhlciBkZXZpY2VzIHRoYW4gdGhlIENQVXMsIHNoYXJpbmcgdGhlIHNh
bWUKcG93ZXItcmFpbCBhcyB0aGUgQ1BVIGNsdXN0ZXIuIEF0IGxlYXN0LCB3ZSBoYXZlIHRoYXQg
Zm9yIGFybS9wc2NpClsxXS4KCj4KPiBJIHN1Z2dlc3Qgd2UgY29udGludWUgdXNpbmcgIi9jcHVz
L3Bvd2VyLWRvbWFpbnMiIERUIG5vZGUKPiBvbmx5IGZvciBwb3dlciBkb21haW5zIHJlbGF0ZWQg
dG8gQ1BVIGNsdXN0ZXJzIG9yIENQVQo+IGNhY2hlLWhpZXJhcmNoeS4KPgo+IEZvciBzeXN0ZW0g
d2lkZSBwb3dlciBkb21haW5zIG9mIFNvQyBkZXZpY2VzLCB3ZSBjYW4gZWl0aGVyOgo+IDEpIFVz
ZSBkZXZpY2UgcG93ZXIgZG9tYWlucyB0aHJvdWdoIHRoZSBTQkkgTVBYWSBleHRlbnNpb24KPiAg
ICAgdmlhIGRpZmZlcmVudCBkcml2ZXIKPiAyKSBVc2UgYSBwbGF0Zm9ybSBzcGVjaWZpYyBkcml2
ZXIKPgo+ID4KPiA+IFdlIGFsc28gbG9vayBhdCBjcHVpZGxlX3BzY2lfZG9tYWluIGRyaXZlciBh
bmQgaXQgc2VlbXMgQXJtIGRvZXNuJ3QKPiA+IGNyZWF0ZSB0aGUgZGV2aWNlcyBmb3IgZWFjaCBz
dWJub2RlIG9mIHBzY2kgZG9tYWluLgo+ID4gSXMgdGhlcmUgYW55IHJlYXNvbiB0aGF0IHRoZXkg
ZG9uJ3QgbmVlZCBpdD8KCldlIGRvbid0IG5lZWQgaXQgZm9yIGFybSBhcyB3ZSBoYXZlIGEgc2Vw
YXJhdGUgbm9kZSBmb3IgUFNDSSBhbmQgaXRzCnBvd2VyLWRvbWFpbnMgWzJdLiBNb3Jlb3Zlciwg
d2UgaGF2ZSBhIHNlcGFyYXRlIGRyaXZlciB0aGF0IG1hbmFnZXMKdGhlIHBvd2VyLWRvbWFpbiAo
Y3B1aWRsZS1wc2NpLWRvbWFpbikuCgpbLi4uXQoKWzFdIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNv
bS9zYzcyODAuZHRzaSAoc2VhcmNoIGZvciAiQ0xVU1RFUl9QRCIpClsyXSBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3BzY2kueWFtbAoKS2luZCByZWdhcmRzClVmZmUKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
