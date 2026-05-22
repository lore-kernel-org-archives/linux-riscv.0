Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4525CD4F3D
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7Yi6Ad2qKQMtcgGpy9wZuuaoyN6DWfuhMkBjuRWcz8=; b=qqY5hnDxM0Gj4t
	PuBlCtH9mMykDW50mYNbj6llQ8o6q1HAle7qpz/GBWcKo+ICuuFID3xlcWgzyRqpS3O0GV2wVMO4h
	GPoPBPO8Erpy/Tza4RYitv7M8o9vBu7kBL/onwBVDtY2LWnqiFattXxhhHZ0W8Hwzfg01h5BuriDS
	wDVrUN7tYN2QBlVEATlmHocX0w0PyjULX1T4ewSPUtefy4aflLVro8tvr0WngtqboDKV9ALkQ99l9
	rQKIRa83YAFdrho4bOMThOAaZtTttU67iN0OyNzjqQgfZxIagpzNBeoLpxx8Oexttp2Ld/nd2MzeY
	SIEg8K1nK7if1zl1xDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKRq-0000000A6rD-22Eu;
	Fri, 22 May 2026 07:37:34 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKRn-0000000A6qE-2Eu8
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 07:37:32 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7dbd801138eso4624562a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 00:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779435450; cv=none;
        d=google.com; s=arc-20240605;
        b=ZCaUbxUgBLUNU1PyCxksoRHyq92lBMnWcgoAmPktcQUpTbaq68kST0vdgceehPcEBb
         vNRyn6Mn2JcgHejuQh3XgGMKls+5uz0mS0zrPwnU826yNPTzoTjHYLXy47VhSoD7tJ+X
         YTliYN7hpozGmnxA+8Bw0IB7w6WXgL1b6w3TprGsj5AyJRMswSLjHeyT8sAoO5EEKJxg
         Rx2YRE/0bl9d6c0Gy8XY2LW2Ob78aqiULqpwiZ7lgU0ZKV1n9N3pL9JY55p+k8uEujj0
         BjcVRa+dLzTB7wZEQ5KG7QLykIbK7+TODDW8WykmUaeNbhE3B2Niy31FT3YIyvuo4oLq
         pvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NghyQ3sQB+XjOL//cNU1NEVX6o5T/OwKFqCB1q+fQfc=;
        fh=vVZ4y/rtIK/EMHDSR/TSdUF41cZzRE1MpC2hgSCNKQA=;
        b=aOUZYVoXfoFq5Wn4inNHq6ya6vFsHeA9G3OHkcenjCEYv6uiguOYhC1fAkhibnNRE8
         vueppQLmPrsREZoc6SJREFlAuXohXzjfAsZalWDge7I9UesNMux5VonC/iIzmVpRjx/K
         Hbgn2VNj8issNnOmLDwR/O8bY5AcApp84oRbOT+mTgYe0Zo0xecQggYTs96vT8zm7EiB
         1+IAgMzy+W86tDZX5EdPlixJkUlzsSrVhJiG2N82OEUoioHOuY5zyOD+FRgOspmemW99
         aaAEJxA2hVQ5aRaQZhUwbkO4D4/oxnSsF4TBAu+qjT1TNi8kqGF0Szjq7AyuKFg14Hi/
         6OAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1779435450; x=1780040250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NghyQ3sQB+XjOL//cNU1NEVX6o5T/OwKFqCB1q+fQfc=;
        b=b3iYqTmiLeQ/3Ztfx9BTBRbhO7hkZVYM8unZIdkTVHTirmLZXqTeLyiO65qpBq3dwT
         meSy0OTKTyqvpeZwEi4CBtzI1MRlucKUgUPDFt1Z+mV3nyDaRquSRz18pwuIdJtTkeTG
         zLKxbx775jo2B/YG/GWqRec53ybS6qjQqkyR7GJJ28XqF3cicC2RpU0tzLViSleavSkU
         WeRkVwu2ltjqV9U2HWzKDzTsw2s8BI/9/atYZsTTXbMQ1Jb8W8q3UjYIUHVB9OaMCLw7
         JV3UUbQLx/fPGOSpw7gT9mENm9xIjBWl+HwbV6onWUbzFMXvG8VRc8W4yVd7FMS+QbDf
         IK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435450; x=1780040250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NghyQ3sQB+XjOL//cNU1NEVX6o5T/OwKFqCB1q+fQfc=;
        b=n3HLZNle9PRKpKZV5z3oQlZUMZASdHyTEpdmrn6Ynr1CZvi5mvWp2hIrelYjs1wxbb
         BMR1lBuWdtYepEBaTmyJPshNi6qpDP+4NouUS4dhvYE8mI715wqdkNNvWpkz/pwq5eiJ
         RrI3fJ2lTXyPmhSpLF3GaC9BZFZr0uFZO+2Ex1KXBCZ42q4q1uGDkQjrB1DagTHgBYV9
         JXOZh5uN+x4GsceQq7WepSGHoniTF4eBR5oQQCdzUfbYrVZq/e+n+Ga4udhLeM6lt2qs
         hxARrS4J9UmsC4I3Ak0JyL6Kk+MyQyXixpwitXIRla437SleWxgwsn0lf/JDn55nf4ex
         WQ4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9M4l7N46cnj7ci96sZx9KD3QbvgUyrsaeJH+KYrlkmLIGTdkxttdOIjZkb8g21UWUsA0eaglxOvBE9qg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrxb5BSMATd7hqN12TW1pRDkm26avXYPZ6GL0iIUCV0peY8tyk
	WdV6hzhqBIU/x5WgFLg29DXvFZuoornI3rKUOHnscDjMzOu8K6rSm4zXHy2RZ5x05PwcB7U9d6D
	duZl2n3UIaszWpll9MZBJ6AT20KwOcVCvR9pISQ5NVw==
X-Gm-Gg: Acq92OFy0n5mNbndNR+qq/LHYmOifMhzZM5lQ6+LBbnTumtrTrHXYqxwSQ0GGc2vu7c
	udsR+Vf/Dk8N1RT6tqdTKLSI0bfl4dOVgzpL0q7xdsF391DEYeg9h292/jVVEmSCdTAzdWZFDKQ
	AWbCmg83Oo/AZaWqlbCvnBIQiWY+ZJlKCjOt3RW0vDPz0ZSto8yd/2Crr8Xdfhrpn8YsyLJ1eBj
	+OoL7K+sIoW3Abc1TKT4ZhODujG9dFMNwBJ7EK/F40Tv/GV+Utdjz/CewplHgP5WfIrQgZZu9V7
	l6EjuLpdzuhMA6cQVAKmDzZ+XCisXCbvPSg=
X-Received: by 2002:a05:6820:c3d3:10b0:699:9cfc:1d6c with SMTP id
 006d021491bc7-69d6e32cf74mr1990136eaf.24.1779435450389; Fri, 22 May 2026
 00:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260519031927.70683-1-cuiyunhui@bytedance.com> <za6ihmyfohx35tt6kyja5yrfqf6xuwzu3sptkf3y24ccqodu7n@yh2vdsobszok>
In-Reply-To: <za6ihmyfohx35tt6kyja5yrfqf6xuwzu3sptkf3y24ccqodu7n@yh2vdsobszok>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 22 May 2026 15:37:18 +0800
X-Gm-Features: AVHnY4L8P8Gh5ItYS8tcXPr6MI2OQNG7Dn-yT_vllv4GcOWIjQ3FUwyQ8TsxD3s
Message-ID: <CAEEQ3wkR-T4qJvMnrtXFchzS8B_ZybRc5pKaw-L_w8yuUN=FUQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] riscv: track effective hardware PTE
 A/D updates
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	akpm@linux-foundation.org, pasha.tatashin@soleen.com, 
	andrew+kernel@donnellan.id.au, rmclure@linux.ibm.com, debug@rivosinc.com, 
	baolin.wang@linux.alibaba.com, zhangchunyan@iscas.ac.cn, apopple@nvidia.com, 
	namcao@linutronix.de, wangruikang@iscas.ac.cn, apatel@ventanamicro.com, 
	liu.xuemei1@zte.com.cn, ajones@ventanamicro.com, cleger@rivosinc.com, 
	charlie@rivosinc.com, hui.wang@canonical.com, guodong@riscstar.com, 
	pincheng.plct@isrc.iscas.ac.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Qingwei Hu <qingwei.hu@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_003731_575347_DE19C225 
X-CRM114-Status: GOOD (  14.27  )
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

SGkgQW5kcmV3LAoKT24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMzo1OOKAr0FNIEFuZHJldyBKb25l
cwo8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkg
MTksIDIwMjYgYXQgMTE6MTk6MjZBTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IFBsYXRm
b3JtcyB3aXRoIFN2YWR1IGJ1dCB3aXRob3V0IFN2YWRlIGFyZSB0cmVhdGVkIGFzIGFsd2F5cyB1
c2luZwo+ID4gaGFyZHdhcmUgUFRFIEEvRCB1cGRhdGVzLgo+Cj4gVGhpcyBpcyBjb3JyZWN0LCBi
dXQgSSd2ZSBiZWNvbWUgc2Vuc2l0aXZlIHRvIHRoZSB3b3JkICdhbHdheXMnIGFmdGVyCj4gcmVj
ZW50bHkgcmV2aWV3aW5nIHRoZSBzdmFkdSBzcGVjLiBXZSBzaG91bGQgcHJvYmFibHkgY2hhbmdl
IHRoZSB0ZXh0IGluCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbCB0byBzb21ldGhpbmcKPiBsaWtlICdhc3N1bWUgU3ZhZHUgdG8gYmUgZW5h
YmxlZCBhdCBib290JyBiZWNhdXNlIGNoYXB0ZXIgMTYgb2YgdGhlIHNwZWMKPiBzdGF0ZXMKCiBH
b29kIHBvaW50LCBJJ2xsIHJld29yZCB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uCgo+Cj4gIiIi
Cj4gSWYgdGhlIFN2YWR1IGV4dGVuc2lvbiBpcyBpbXBsZW1lbnRlZCwgdGhlIG1lbnZjZmcuQURV
RSBmaWVsZCBpcyB3cml0YWJsZS4KPiBJZiB0aGUgaHlwZXJ2aXNvciBleHRlbnNpb24gaXMgYWRk
aXRpb25hbGx5IGltcGxlbWVudGVkLCB0aGUgaGVudmNmZy5BRFVFCj4gZmllbGQgaXMgYWxzbyB3
cml0YWJsZS4KPiAiIiIKPgo+IFNvLCBpZiBBRFVFIGlzIHdyaXRhYmxlIHRoZW4gaXQgY2Fubm90
IGJlIGhhcmR3aXJlZCB0byAxLCB3aGljaCBtZWFucyBpdAo+IGNhbiBiZSB3cml0dGVuIHRvIHpl
cm8uIFRoZW4sIGluIDMuMS4xOCwgd2UgaGF2ZQo+Cj4gIiIiCj4gV2hlbiBBRFVFPTAsIHRoZSBp
bXBsZW1lbnRhdGlvbiBiZWhhdmVzIGFzIHRob3VnaCBTdmFkZSB3ZXJlIGltcGxlbWVudGVkCj4g
Zm9yIFMtbW9kZSBhbmQgRy1zdGFnZSBhZGRyZXNzIHRyYW5zbGF0aW9uLgo+ICIiIgo+Cj4gd2hp
Y2ggbWVhbnMgYSBzcGVjLWNvbXBsaWFudCBzeXN0ZW0gY2FuIG5ldmVyIGhhdmUgc3ZhZHUgd2l0
aG91dCBzdmFkZS4KPgo+IFRoYW5rcywKPiBkcmV3CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
