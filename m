Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732D0C0219D
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 09:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPvQmUGJO/+oERTVVZxDxWlw/V9v3f8m4irQ2U/TYMw=; b=t/U/oi999RMboG
	WU+ZLpc1WobYyWyw7bcvZeAYBh5UNnARPPbJTKsrt3Q1lGHe6FRfJSjrUIUyxyoF6yS2AmVmE1PcF
	tiTnXVtFCOEfeTZb57dQANoa9tmW2YhEh1LusSo44SMqPC9aUczR+WzN7K1OouP1NenY5cXvBWkgT
	PLX6an+lE6MxXa5PUxHgbWLEW4LNfo8rp+278OXq+0Q/DBecEVWP0Me5lzBq3fHhMNH2CcYUvE69A
	X9prBi6VQJn3xlyrgMiwDPR8PDlhAnNz6vc6+cz6GmNWN4EC7WzebGqjrRUPeQwtqEtgTgYwyIcjT
	qoLMTHxBASym+oStjy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQ3w-0000000GoiO-3ZgE;
	Mon, 10 Feb 2025 09:26:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQ3t-0000000Gohj-3HHi
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 09:26:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4394820123dso1964065e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 01:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739179600; x=1739784400; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oGncZmhhAl71N1BLRgPGV01QcraTmYUOqNVFCE5sYHI=;
        b=jL3hv9Su+8Mlk0Sc4sV8nKl9PryS5ECIn8WUrfhpR7I8Ho1PZnZT90bvApCIdea1jO
         eU3MagYkufayj2xn7Q5hDylhhZoFlqhUXstRpORF1Xi7EJh5BP2q6C8uBtJl0SzrKqE+
         TGioBTzM8Cwm70nAKXAh5LfaHok8vNMI3MwWjE0i+C4Tlnswtu96GM5vLmdZUzc0mAd1
         OXqJpit0EEi+9vz9U0jiiOW/WBuUqw4GDR+HTFLFAnfRKxPjIZ7NybRIGEQw/eAmQXwo
         C6LAW4x4GQmel/kY7q0j0DE8HzdI404INNZuaYaHZjOtoPCb1Uvi9EAztQglH6a6efBw
         KKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179600; x=1739784400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGncZmhhAl71N1BLRgPGV01QcraTmYUOqNVFCE5sYHI=;
        b=QRc/Ad29oOfjngy+HQqHj47f9p7U1Lol62PaqkU6frYmE0fYeSwRbVbtHKRQxL8hHa
         Ri+6eVN05WbMl0nc2OSDY7UlPv6UdUt3lnhYYBoi6aQcqIyxsGpo7MdfoZewQdHid9JQ
         Q2LcyVfIjPpOLD/HKdcuXWCWeVXLfn2bDQ9K44LG6i+hxtMajaLY3F6Fn3b9BVfyix3m
         UfdvXeeB8GMZPFTAzr8DliCj1nM6AxXNT3nCfZO1YghOfhnK272IBpa0LDX9RN/0C8Lw
         +Pf36xnkC8+5EzCDahQaY2SOw8YqkExAFVrPaVyH1uFCiWW8pYX4K6GOGVHhH4TInytk
         RPNA==
X-Gm-Message-State: AOJu0YwAvSr5R8n5dHMSmcvzJHo9VXSEqzZ0au4edQWAU4brqsatO33B
	ALiBPAnW68LFitIHbooYoR4N2bTYkQ3uq6hISg1ZyskOEblWz7YSxa7k5REP8KilIjzQ6zKRg4U
	8
X-Gm-Gg: ASbGncuzD252A8RTh6SdTF/CLBo4rsPg0QhA9ov7XK3FBQDqgrlHOrWjTgTAjnkGi2B
	SxbZrMB3AprSepoxQQzFjZjY8E5hmLi8/7e0od4GHXZTWlty27gG73a/Y5AxUJuZucPXOEGGpzA
	CvjtOTREUF0Is+j2lFWlZLY/QIh9tDvqOfOo3i9Td4qy75vnrw7XcoYBM42brNDyiODNGkKnkGx
	mPY7a2Y+tDdwOH5bB5cp08UlZrYjT/afoEG0ZyZ2ckh+QAL55YQYp6aECPuEL4beLtJu7fgDXNS
	lQQ=
X-Google-Smtp-Source: AGHT+IF2CDz3pJKnrOBObISkQd93Q04LKnWAfrGEobivnDx0uhirrebToLjWRMbheYbNUb8g9q6ZTg==
X-Received: by 2002:a05:600c:5110:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-4392497dad8mr98819615e9.6.1739179599483;
        Mon, 10 Feb 2025 01:26:39 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394679a3a1sm16563815e9.5.2025.02.10.01.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:26:39 -0800 (PST)
Date: Mon, 10 Feb 2025 10:26:38 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, jesse@rivosinc.com
Subject: Re: [PATCH 0/9] riscv: Unaligned access speed probing fixes and
 skipping
Message-ID: <20250210-d575562e04d84ca570e26f5d@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <CAK9=C2XmFtLHAxuWJVdvkUHFQTM+mE-D8E4sLvKxxUj_CqcbAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XmFtLHAxuWJVdvkUHFQTM+mE-D8E4sLvKxxUj_CqcbAQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_012641_826820_11E3437E 
X-CRM114-Status: GOOD (  25.92  )
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

T24gU2F0LCBGZWIgMDgsIDIwMjUgYXQgMDE6Mjk6NDJQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBGcmksIEZlYiA3LCAyMDI1IGF0IDk6NDnigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgZmlyc3Qgc2l4IHBhdGNoZXMg
b2YgdGhpcyBzZXJpZXMgYXJlIGZpeGVzIGFuZCBjbGVhbnVwcyBvZiB0aGUKPiA+IHVuYWxpZ25l
ZCBhY2Nlc3Mgc3BlZWQgcHJvYmluZyBjb2RlLiBUaGUgbmV4dCB0d28gcGF0Y2hlcyBpbnRyb2R1
Y2UKPiA+IHN1cHBvcnQgdG8gc2tpcCBwcm9iaW5nIGJ5IG1hdGNoaW5nIHZlbmRvci9hcmNoL2lt
cCBpZHMgYW5kIGNoZWNraW5nIGEKPiA+IHRhYmxlIGZvciB0aGUgYWNjZXNzIHNwZWVkIHR5cGUu
IFRoZSBsYXN0IHBhdGNoIGFwcGxpZXMgdGhlIG5ldyBza2lwCj4gPiBzdXBwb3J0IHRvIFZlbnRh
bmEgaGFydHMuCj4gCj4gQWx0ZXJuYXRpdmVseSwgd2UgY2FuIGFsc28gc2tpcCBwcm9iaW5nIG1p
c2FsaWduZWQgYWNjZXNzIHdoZW4gWmljY2xzbQo+IGV4dGVuc2lvbiBpcyBwcmVzZW50IGluIHRo
ZSBJU0Egc3RyaW5nLiBUaGUgWmljY2xzbSBleHRlbnNpb24gaXMgZGVmaW5lZAo+IGFzIHBhcnQg
b2YgdGhlIHJhdGlmaWVkIFJWQTIzIHByb2ZpbGUuCgpUaGUgZGVmaW5pdGlvbiBvZiBaaWNjbHNt
IGRvZXNuJ3QgZXhwbGljaXRseSBzdGF0ZSB0aGF0IG1pc2FsaWduZWQgd29yZAphY2Nlc3NlcyB3
aWxsIGJlIGZhc3RlciB0aGFuIGJ5dGUgYWNjZXNzZXMgdG8gdGhlIHNhbWUgYWRkcmVzc2VzLiBU
aGVyZSdzCmFsc28gdGhpcyBzcGVjIGlzc3VlWzFdIHdoaWNoIGFwcGVhcnMgdG8gc3RhdGUgdGhh
dCBaaWNjbHNtIGNhbm5vdCBiZSB1c2VkCnRvIGluZmVyIGZhc3QgbWlzYWxpZ25lZCBhY2Nlc3Nl
cy4KCkJ1dCwgbGlrZSBDaGFybGllIHN1Z2dlc3RzLCBtYXliZSB3ZSBzaG91bGQgYWR2b2NhdGUg
dGhlIGNyZWF0aW9uIG9mIGFuCmV4dGVuc2lvbiAob3IgIm5hbWVkIGZlYXR1cmUiKSB3aGljaCBh
bGxvd3Mgc3BlY2lmaWNhbGx5IGFkdmVydGlzaW5nIHRoYXQKbWlzYWxpZ25lZCBhY2Nlc3NlcyBh
cmUgZmFzdC4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtaXNhLW1hbnVhbC9p
c3N1ZXMvMTYxMQoKVGhhbmtzLApkcmV3Cgo+IAo+IFJlZ2FyZHMsCj4gQW51cAo+IAo+ID4KPiA+
IChJJ2QgYmUgaGFwcHkgdG8gc3BsaXQgdGhlIGZpeGVzIGZyb20gdGhlIG5ldyBza2lwIHN1cHBv
cnQgaWYgd2Ugd2FudCB0bwo+ID4gZGlzY3VzcyB0aGUgc2tpcCBzdXBwb3J0IGluZGVwZW5kZW50
bHksIGJ1dCBJIHdhbnQgdG8gYmFzZSBvbiB0aGUgZml4ZXMKPiA+IGFuZCBJJ20gbm90IHN1cmUg
aWYgcGF0Y2h3b3JrIHN1cHBvcnRzIEJhc2VkLW9uOiAkTUVTU0FHRV9JRC8kTE9SRV9VUkwKPiA+
IG9yIG5vdCBhdCB0aGUgbW9tZW50LCBzbyBJJ20ganVzdCBwb3N0aW5nIHRvZ2V0aGVyIGZvciBu
b3cgaW4gb3JkZXIgdG8KPiA+IGJlIGFibGUgdG8gY2hlY2sgZm9yIG15IHBhdGNod29yayBncmVl
biBsaWdodHMhKQo+ID4KPiA+IFRoYW5rcywKPiA+IGRyZXcKPiA+Cj4gPiBBbmRyZXcgSm9uZXMg
KDkpOgo+ID4gICByaXNjdjogQW5ub3RhdGUgdW5hbGlnbmVkIGFjY2VzcyBpbml0IGZ1bmN0aW9u
cwo+ID4gICByaXNjdjogRml4IHJpc2N2X29ubGluZV9jcHVfdmVjCj4gPiAgIHJpc2N2OiBGaXgg
Y2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cwo+ID4gICByaXNjdjogQ2hhbmdlIGNoZWNr
X3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxsX2NwdXMgdG8gdm9pZAo+ID4gICByaXNjdjogRml4
IHNldCB1cCBvZiBjcHUgaG90cGx1ZyBjYWxsYmFja3MKPiA+ICAgcmlzY3Y6IEZpeCBzZXQgdXAg
b2YgdmVjdG9yIGNwdSBob3RwbHVnIGNhbGxiYWNrCj4gPiAgIHJpc2N2OiBQcmVwYXJlIGZvciB1
bmFsaWduZWQgYWNjZXNzIHR5cGUgdGFibGUgbG9va3Vwcwo+ID4gICByaXNjdjogSW1wbGVtZW50
IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfdGFibGUKPiA+ICAgcmlzY3Y6IEFkZCBWZW50YW5hIHVu
YWxpZ25lZCBhY2Nlc3MgdGFibGUgZW50cmllcwo+ID4KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2NwdWZlYXR1cmUuaCAgICAgICAgfCAgIDQgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlbmRvcmlkX2xpc3QuaCAgICAgfCAgIDEgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzX21pc2FsaWduZWQuYyAgICAgICB8ICAxNCArLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Vu
YWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyB8IDI3OCArKysrKysrKysrKysrKy0tLS0tLS0KPiA+ICA0
IGZpbGVzIGNoYW5nZWQsIDIwMCBpbnNlcnRpb25zKCspLCA5NyBkZWxldGlvbnMoLSkKPiA+Cj4g
PiAtLQo+ID4gMi40OC4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
