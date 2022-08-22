Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48250C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/z0rUr6LLsoY4Uje5mcWuZMTm2m31ifBMI/ieRqIdxM=; b=ZVVNaOSi03f+z2
	ldp1hobhKBcrNnq8M0FcBiVsQrckVICr/mVpFy0wvUP1/3AIcxgToA1S73nIGhecW36BXq70IpJiW
	P4vbYed32YGsCWp8IRLprXfUkzFpX8r8YzSSYcLQKxEsmZ8OOuPW9cpouXhwU1AGYYdtPr7gyYOno
	0FBK5Gpw15BPvX4K0W9LGAzOypA4JBSeW03jXa2ojV0TbKnmzhG0m4/oWr6yZmgcb5qo9glgA5enj
	YFSKGoFyKn7H5MYLAvXJ2E+o7tI1vAWJrFMXMsxz46Mb3vEkGBvKcVauXfa5SFdQjyl/NZX2ALnMt
	QzNqrSVVneKjRxy8vN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9N0-00CCs0-E6; Mon, 22 Aug 2022 15:29:42 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9MQ-00CCGr-Fn
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 15:29:09 +0000
Received: by mail-wr1-x42b.google.com with SMTP id n4so13661378wrp.10
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=Tj/TeA1Vba5/YB2iX5+tYIMrGWJcVWB+zymgkTHRpAI=;
        b=ggvUSWKEViLarUpllfN8d3/D/U3wXUfnghmeXfQzCGOlRYHhcU8UMzw/F+Bimd1PfO
         zNyWPt+OcrJ9/jp2YaN0/V06NbEurpv8kfhhxbxDnA4dncOMgBVIMsnkoDQ84ndL0S55
         Hhk4mGLPxrL5ffb9JwxdEFu38eJwdJLT6MJs403e09BL5yutuC36oNq8raxcJxoTfBxx
         bYENxKw1cYcFPdk0rcbI4r/XcbmXoBJmbwyKBmyFFhFj7wG15WWHbGLbB0nIpEUjIRkc
         sGBQWBkGqZViw77T2vsLwAfY3/nLH8nyjKe5hcg7qKr7SuLyWM5ahcrcin+v872QyJjc
         42OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=Tj/TeA1Vba5/YB2iX5+tYIMrGWJcVWB+zymgkTHRpAI=;
        b=Lo1u387JJzsgKErOEJBX2ImdIYzEMX7Bk52ZGSvkK9NwRmfKdqOF/h6D9Eo+LeBmeZ
         C0kzdFz+R8wl2N966qc99Z5u3IcoytLWWCEtT02yY23KHjsL4/1Lyo9AgJIYpZohUAYa
         iibi7LYey/iI+fMjWBDL4xPhYqZmgKAD6x3cfnMgBDqQn1bmcQtZsklbKVc3Ump8BHKp
         NTg8dK1aIfhjToxv4MjF6YOvV3Oni6CP5MXLiW/THMJq9KfRy6lgaYmaq6+a+fASxriE
         i851rTbFmMvLWsrdCYhAHrAr/3ncHLDBP1x3jZooFa+QMEtEfv0yeees2hL2XmBE/AQy
         vv+Q==
X-Gm-Message-State: ACgBeo0fH75CbOdiz1uzuNdmlW1PccYyoO45V0QHR0KY5MLox6Lvg+4R
	Fn22uulT+ZPM5WKSoKEIDtdk4A==
X-Google-Smtp-Source: AA6agR5jyKhduztzqIDdkOhDPCZJoNwrA8EEV359JObFTzjtKAAYctHbcxiaZLRQPrwTe5m6Oe8cZQ==
X-Received: by 2002:a05:6000:1867:b0:21f:f2cf:74a8 with SMTP id d7-20020a056000186700b0021ff2cf74a8mr11195780wri.344.1661182144304;
        Mon, 22 Aug 2022 08:29:04 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id o14-20020adfcf0e000000b0021f1ec8776fsm12053546wrj.61.2022.08.22.08.29.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Aug 2022 08:29:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <44b6f601-1a11-aacf-5592-5b61550afb9f@microchip.com>
Date: Mon, 22 Aug 2022 16:29:02 +0100
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 andre.przywara@arm.com,
 devicetree <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel@sholland.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jernej.skrabec@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 wens@csie.org,
 robh+dt@kernel.org,
 palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org,
 paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Message-Id: <C0B4F750-1C99-408A-A2DA-B72BBF7361B4@jrtc27.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-7-samuel@sholland.org>
 <20220815141159.10edeba5@donnerap.cambridge.arm.com>
 <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
 <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
 <c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me>
 <c7599abd-c4cf-9ddd-1e74-e47dec9366d4@microchip.com>
 <CAMuHMdUHVpj9ikE2NxpBSBtTG8K6v92vGdbw3GLmEYUoVzatvg@mail.gmail.com>
 <538ae41e-664f-2efb-f941-9a063b727b6a@microchip.com>
 <CAMuHMdWWbR+Y=bJ7gdqV3d+ffHE1-hwQf-Owb8FAvZAaScdOgA@mail.gmail.com>
 <44b6f601-1a11-aacf-5592-5b61550afb9f@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_082906_619564_A0DB851C 
X-CRM114-Status: GOOD (  15.23  )
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

T24gMjIgQXVnIDIwMjIsIGF0IDE0OjU2LCBjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbSB3cm90
ZToKPiAKPiBPbiAyMi8wOC8yMDIyIDEzOjMxLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4+
IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+PiAKPiAKPiAKPj4+IERvIHlvdSB0
aGluayB0aGlzIGlzIHdvcnRoIGRvaW5nPyBPciBhcmUgeW91IGp1c3QgcHJvdmlkaW5nIGFuCj4+
PiBleGFtcGxlIG9mIHdoYXQgY291bGQgYmUgZG9uZT8KPj4gCj4+IEp1c3Qgc29tZSBicmFpbnN0
b3JtaW5nLi4uCj4+IAo+Pj4gV2hlcmUgd291bGQgeW91IGVudmlzYWdlIHB1dHRpbmcgdGhlc2Ug
bWFjcm9zPyBJIGZvcmdldCB0aGUgb3JkZXIKPj4+IG9mIHRoZSBDUFAgb3BlcmF0aW9ucyB0aGF0
IGFyZSBkb25lLCBjYW4gdGhleSBiZSBwdXQgaW4gdGhlIGR0cz8KPj4gCj4+IFRoZSBTT0NfUEVS
SVBIRVJBTF9JUlEoKSBtYWNybyBzaG91bGQgYmUgZGVmaW5lZCBpbiB0aGUKPj4gQVJNLWJhc2Vk
IFNvQy5kdHNpIGZpbGUgYW5kIHRoZSBSSVNDLVYtYmFzZWQgU29DLmR0c2kgZmlsZS4KPiAKPiBS
aWdodCwgb25lIGxldmVsIHVwIGJ1dCB+dGhlIHNhbWUgcmVzdWx0Lgo+IAo+IAo+Pj4+IE5pY2Uh
IEJ1dCBpdCdzIGdvbm5hIGJlIGEgdmVyeSBsYXJnZSBpbnRlcnJ1cHQtbWFwLgo+Pj4gCj4+PiBJ
IHF1aXRlIGxpa2UgdGhlIGlkZWEgb2Ygbm90IGR1cGxpY2F0aW5nIGZpbGVzIGFjcm9zcyB0aGUg
YXJjaHMKPj4+IGlmIGl0IGNhbiBiZSBoZWxwZWQsIGJ1dCBub3QgYXQgdGhlIGV4cGVuc2Ugb2Yg
bWFraW5nIHRoZW0gaGFyZCB0bwo+Pj4gdW5kZXJzdGFuZCAmIEkgZmVlbCBsaWtlIHVuZm9ydHVu
YXRlbHkgdGhlIGxhcmdlIGludGVycnVwdCBtYXAgaXMKPj4+IGluIHRoYXQgdGVycml0b3J5Lgo+
PiAKPj4gSSBmZWVsIHRoZSBzYW1lLgo+PiBFdmVuIGxpc3RpbmcgYm90aCBpbnRlcnJ1cHQgbnVt
YmVycyBpbiBTT0NfUEVSSVBIRVJBTF9JUlEobmEsIG5yKQo+PiBpcyBhIHJpc2sgZm9yIG1ha2lu
ZyBtaXN0YWtlcy4KPj4gCj4+IFNvIHBlcnNvbmFsbHksIEknbSBpbiBmYXZvciBvZiB0ZWFjaGlu
ZyBkdGMgYXJpdGhtZXRpYywgc28gd2UgY2FuCj4+IGhhbmRsZSB0aGUgb2Zmc2V0IGluIFNPQ19Q
RVJJUEhFUkFMX0lSUSgpLgo+IAo+IFl1cCwgaW4gdGhlIHNhbWUgYm9hdCBoZXJlLiBtYXliIEkn
bGwgZ2V0IGJvcmVkIGVub3VnaCB0byBiaXRlLi4KCk5vdGUgdGhhdCBHUEzigJllZCBkdGMgaXNu
4oCZdCB0aGUgb25seSBpbXBsZW1lbnRhdGlvbi4gRnJlZUJTRCB1c2VzIGEKQlNELWxpY2Vuc2Vk
IGltcGxlbWVudGF0aW9uWzFdIGFuZCBzbyBhZGRpbmcgbmV3IGZlYXR1cmVzIGxpa2UgdGhpcyB0
bwpHUEwgZHRjIHRoYXQgYWN0dWFsbHkgZ2V0IHVzZWQgd291bGQgcmVxdWlyZSB1cyB0byByZWlt
cGxlbWVudCBpdCB0b28uCkkgZG9u4oCZdCBrbm93IGhvdyBtdWNoIGVmZm9ydCBpdCB3b3VsZCBi
ZSBidXQgcGxlYXNlIGtlZXAgdGhpcyBpbiBtaW5kLgoKSmVzcwoKWzFdIGh0dHBzOi8vZ2l0aHVi
LmNvbS9kYXZpZGNoaXNuYWxsL2R0YwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
