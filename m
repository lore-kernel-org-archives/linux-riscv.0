Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439F8C0015E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dh3L3OP7Onm/D7UGjq1iRXZfXBwMKOYYKi2FmBgqvr0=; b=SHmNXfOhDWiv/n
	FTaEUQ9geTXeoNsZEATcYohJaWZcCpDVxpDopQFtcf446L+airM733cjqwGtCmxnXMFNHmXdgJGr7
	V2Dhswq6iiD9G/KcWyuePSKmJwpQ8vQX+nsJmD1z6yIjr85gcrxOWH/BU2i9zJG6L9wNJtYxbJNfc
	0SIbWRbbYLFqty3M64vC4kB2SmXBFrLDooD0uL6eO8ck3lsURmRzW5L0/iLBh6VvGSDoKCBcuYVQG
	1fKXhkAQH3/NpPaB6Whmng4y0qVwU1Hd+CYGjxQg9QzN9hJqeZzK73fhN4K0a5Y5nO7W1/KegHSeU
	V9Ku2xm/yvB0h4TLj5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUdZ-007CoJ-2l;
	Thu, 03 Aug 2023 09:28:53 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUdX-007Cmk-0H
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 09:28:52 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-58451f0fefeso7844917b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691054928; x=1691659728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPf/DhBfYOXvHBKonH2IymFP4pV5nyzM2qqAWXWq22A=;
        b=nvRhlx3RKrMSDt0Zuc+myu9tFV2g0lK7zhUf5+vgZoGn04BXuqG2K4hQzoOyzZVdT9
         2crnCI2OM7vbmiQbRXPS5TqxCO2VUOfR2SJXWMpJc3kYMB1mhi2iJWxTuWK/8B1EAbhv
         l3fy+treICAr4vKN0PWbxMCyspG1oeVBlww6JTdpwRZaswn9FVMXc1Lxah9zUYEm0aIc
         p1/sxFrBm4W7dqN+NnIMGSx+Sr3iTy6DiuagqT4+fqxYxwkrSMJ5Sa4iUMoErrtGUcyW
         KzdXSTU4VPNWj/2xvu3G+2I4qiDHYYvsbj+SJU5amUBbn3AY7IixJmDZq/Ak2IGSvxwF
         Gh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691054928; x=1691659728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPf/DhBfYOXvHBKonH2IymFP4pV5nyzM2qqAWXWq22A=;
        b=Ke6TpcLbyrLGxvaJcPx2yVawYyU/8YSkE8A2LMbWMzrMiR9U4rQ2DyFJas2wZmL9AQ
         Cl/SabdnnxYBJ929lnpcN1rLan2oLS++eVpRBjDKMqWYIvefncCh7e4lnG1a5kSUiI+D
         GzgNp/Yc5kcI6MuB+nHmofUEgTcIBKHQoZ2zQI19gp80DAzFz/Ymv+54oScNq90GQE+k
         LbIXuzezeiFCHOtMHOP1AjOi04sqZGA2yhF6RiNaDtApSoWqbbvnApnx6XYfxBzSKNwG
         AwNLVH7Bt//ldkctliL+0TqQg2mkayWMAPhpu8uE2s5NJnoM1yXGVhBYTil5yqyXsTGs
         Y02g==
X-Gm-Message-State: ABy/qLbcKOXe+KJ2BRH0hXQy94sxSCaJlFjL7Zhw72bc3a8Y2P3XGMjk
	nKTg9uFe+knzo6avopE/ZkJ90veq6JimNVJnxIafSQ==
X-Google-Smtp-Source: APBJJlFp3C9muFBq6D0MrZecgIa2l1jTs2IKHm59WpOG88pYICmMaCXa10IkEqz/8+2ECNYlmZL4zUSVMdMAzlJFvhA=
X-Received: by 2002:a81:9242:0:b0:583:9c78:9a84 with SMTP id
 j63-20020a819242000000b005839c789a84mr17812965ywg.43.1691054928381; Thu, 03
 Aug 2023 02:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230803085734.340-1-nylon.chen@sifive.com> <20230803085734.340-2-nylon.chen@sifive.com>
 <20230803-avenge-vaporizer-8258cd3ed423@wendy>
In-Reply-To: <20230803-avenge-vaporizer-8258cd3ed423@wendy>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Thu, 3 Aug 2023 17:28:37 +0800
Message-ID: <CAHh=Yk8Y0VFcSKVGTREcQtHVTyyha93k8N5FsYG970Gg=JeijQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] riscv: dts: sifive: unleashed/unmatched: Remove
 PWM controlled LED's active-low properties
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, geert+renesas@glider.be, pavel@ucw.cz, 
	vincent.chen@sifive.com, emil.renner.berthing@canonical.com, 
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor@kernel.org, 
	zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_022851_157924_705C10B3 
X-CRM114-Status: GOOD (  13.86  )
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

SGkgQ29ub3IsCgpJIGFwb2xvZ2l6ZSBmb3IgZm9yZ2V0dGluZyBhYm91dCB0aGlzIHVwZGF0ZSBl
YXJsaWVyLiBKdXN0IG5vdywKSSB0cmllZCB0byBwdWxsIHJlYmFzZSBtYXN0ZXIgYW5kIG5vdGlj
ZWQgdGhhdCBvdGhlciBkZXZlbG9wZXJzIHNlZW0KdG8gaGF2ZSBtYWRlIHNvbWUgZml4ZXMgdG8g
dGhlIGFsZ29yaXRobS4gVXBvbiBjbG9zZXIgaW5zcGVjdGlvbiwgSQpmb3VuZCB0aGF0IHRoZXkg
YWRkcmVzc2VkIHRoZSBwYXJ0IHdlIHByZXZpb3VzbHkgZGlzY3Vzc2VkIHdpdGggRW1pbAphbmQg
VXdlLCBzdWNoIGFzICJmaXJzdCBwd21fYXBwbHlfc3RhdGUuIgoKVGhlcmVmb3JlLCBteSBpbnN0
aW5jdCB0ZWxscyBtZSB0aGF0IHRoZXkgaGF2ZSBhbHJlYWR5IHRha2VuIGNhcmUgb2YKdGhlIGlz
c3VlcyB3ZSBkaXNjdXNzZWQgYmVmb3JlLgoKSSB3aWxsIHJldmlldyB0aGUgY29uZmxpY3Rpbmcg
cGFydHMgaW4gdGhlIHB3bS1zaWZpdmUuYyBjb2RlIGluIG15IHY0CnZlcnNpb24gb25jZSBhZ2Fp
biB0byBlbnN1cmUgdGhlcmUgYXJlIG5vIG9taXNzaW9ucy4gSWYgSSBmaW5kIGFueSwgSQp3aWxs
IHN1Ym1pdCB2NSBhY2NvcmRpbmdseS4KCkNvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+IOaWvCAyMDIz5bm0OOaciDPml6Ug6YCx5ZubIOS4i+WNiDU6MTnlr6vpgZPvvJoK
Pgo+IE9uIFRodSwgQXVnIDAzLCAyMDIzIGF0IDA0OjU3OjM0UE0gKzA4MDAsIE55bG9uIENoZW4g
d3JvdGU6Cj4gPiBUaGlzIHJlbW92ZXMgdGhlIGFjdGl2ZS1sb3cgcHJvcGVydGllcyBvZiB0aGUg
UFdNLWNvbnRyb2xsZWQgTEVEcyBpbgo+ID4gdGhlIEhpRml2ZSBVbm1hdGNoZWQgZGV2aWNlIHRy
ZWUuCj4gPgo+ID4gVGhlIHJlZmVyZW5jZSBpcyBoaWZpdmUtdW5sZWFzaGVkLWEwMC5wZGZbMF0g
YW5kIGhpZml2ZS11bm1hdGNoZWQtc2NoZW1hdGljcy12My5wZGZbMV0uCj4gPgo+ID4gTGluazog
aHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlL2M1MmE4ZTMyLTA1Y2UtNGFhZi05
NWM4LTdiZjg0NTNmODY5OF9oaWZpdmUtdW5sZWFzaGVkLWEwMC1zY2hlbWF0aWNzLTEucGRmIFsw
XQo+ID4gTGluazogaHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMuaW8vc2lmaXZlLzZhMDZkNmMw
LTZlNjYtNDliNS04ZTllLWU2OGNlNzZmNDE5Ml9oaWZpdmUtdW5tYXRjaGVkLXNjaGVtYXRpY3Mt
djMucGRmIFsxXQo+ID4KPgo+ID4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+Cj4KPiBTaW5jZSB0aGVyZSBpcyBubyBQV00gZHJpdmVyIHBhdGNoIGZv
ciB0aGlzIHRvIGdvIGFsb25nIHdpdGgsIHRoaXMgYWNrCj4gZG9lc24ndCBtZWFuIGFueXRoaW5n
IGFueW1vcmUuIFBsZWFzZSBkcm9wIGl0IGlmIHlvdSByZXN1Ym1pdC4KPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
