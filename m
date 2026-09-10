Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C668AC79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/KCdMrr9OfFLrYS/dd93trI+hUpe1cxX02X6tuBv9Q=; b=Hl1PHbkcu8Tqw1
	UUU3Itt2Pry5gl4md79GMO+oSWXGwtyTVuEvs5MY9zP+nlCv1urTGjZ3zXdLKsszT8SONDtvGxCW5
	ui0uf2Y8/SsbVY8RXBHAZ5QC78NM8pOHnNXDEq1mrVAUHwFwIwmo4iFBLQNxOSzoI5O5kGtgb/0W1
	ue1la6vuE8c7q2G3wFMFErfNrALwbcWRerBiqKV7sura6+0vUbre/43OBrX1HDvBpSRoV/v4edEZh
	/EYZ0tayiXC5VV/SHbnBk/0DeGfWSc09cY1HZoD4t7NJAa0WxmdLSeUAwQqlTDWREzl+g0fW2O9ii
	7OTUD3Q9x0ifgXMpuckQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZT3-0000000Df3C-121n;
	Thu, 10 Sep 2026 07:45:09 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZT0-0000000Df2i-3Wnk
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 07:45:08 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-455ca262ccbso5750364fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 00:45:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789026305; cv=none;
        d=google.com; s=arc-20260327;
        b=fqcceYLMJF74+DkMoDZMyFIqhsxbpN+AHHSnWge2E7pt+QD4O0TcFJ5WU1Lqno3Ykf
         5GHLVadqOwYu609PKG5ea9jiDj1FABLZkeBGUrp4q4oz3gylOYnsAQXC9AiZNre4grNe
         dpFEuebiEM0dPDB76iBAnzQ7D3un8OqDxyNYCUygmRSb/iJbSfdM+M83c1Lm9GUSNZn5
         3GAkX9M+ZnERB6rWnBdVObCUcEnoZC2p74W5YiseQ4y2nKpJGh/Lh9bjNLmrC/A2jLxj
         7isHvnmFlVYgR6OO+LPrONmsjedP9AKfotRi15oMd9awMzN0MOW0lrCbncLRNjmiFGjg
         rHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t97SGPNZAnJHeKFtJcoCg2z7Ip5w5MQVLj+TAqyZCW0=;
        fh=zvR51aKTXdaGk/0ikaKaFM7DcZ7WQ8jikBTB6PR0FkY=;
        b=rT2YEurXM5yKyG+JxkOsq/cNB1tCyayX1HrjG51nLQvrxC9xAOh2Uyv5CXqgsySQC8
         nyEZDD0OXEa7F63RqJ5G3Olir8/Hc34qU8uh2pDMDRJ6SiSMEDgS41jd5zTvJUcqzS6d
         7bzPZlBGAxAWYvUw1c5LQ5jSyb61cgo7nLnamfo1DqU541dAL7hE7j9CXYGQUMQ225gm
         zd5mb713dgRgBIxAr3MafgbwnACf/7dSG6mtjwSeGbpYKEaNgcbfb4hTZ61veKZiJzBe
         PbaUOM0AMKb7tDBvAP3LhdVaZ6GUkPYQhPNsu0ZeYejZKIWNl4Qa0zwsjB5+5WhmjkqG
         t6MQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789026305; x=1789631105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t97SGPNZAnJHeKFtJcoCg2z7Ip5w5MQVLj+TAqyZCW0=;
        b=LqM96FqxWkRLB5WfvHSNgrKWIjmfvQ1+heMhQybdhrZ0t7MnZD2lf6L3MktoCAdGSh
         EfimIfoUNxX4RPLJC4l+0W6V5cEOPMLZKRwV0R6b6bXlRGjrTV/tcBj01/mpCY4xTZka
         lIKLyQAVMNqGCQWu2RWBg9aHkTfUqD7tpaME6aJt+L7+Z2pFiZU9dhoXYB1Rg3bAUEPn
         QI2HpUme0Qjd6mjLBDQKBY2cCT437D7mJv4FupuKiLopB0ezwPK/wqFvsND4rco87VOt
         +Ppu7kQCB/njtt21lhc9/sDdP3zgXNcDrhGvqVpYZTrwsTEPDiskhhuwJCOUpbmKXBOB
         H76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026305; x=1789631105;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t97SGPNZAnJHeKFtJcoCg2z7Ip5w5MQVLj+TAqyZCW0=;
        b=Elut2mFoudt2hmTAQZUfxVHsqMUyyYYe7g0CZDz0T8hK7FWOh1v2RyfYnc6tPoT/Vo
         7+OZTnGuWg4MrSOrAzTd7kvDp2ckXA7ITPWVXQ/OlbHtxH8ugpKcJZGcNlRs9gj0Drc0
         FXqF7e4B6p8E0F0X0d1NNkz/LHlbV4NaTgtrklQ70gtWOz0Z9NMd15snYkzCYp1EzCCQ
         pDm8bUWTemzUBp+0rvW3AW0DIyr9S7jls6ORxR8DqQO4BpzV/QrIjGeoa/dpJO+r4lwF
         f4KuJhMjZxGJvj5WZ6ZQu2NgNQF+lMyEKkVh6RKtsBCVS0PwVyGpgevIeYzO/u7poNtE
         +P8w==
X-Forwarded-Encrypted: i=1; AKwUvBx6lR1CEU4gwmPlRrNY3das/5UfvHHYbx4hKvAe9gCCNg4dU5nN9wWaZe8VfHoX+BakiFvvjYAwpM+3Zg==@lists.infradead.org
X-Gm-Message-State: AFuF++loqQUZiGQpNV8ZblKAT8mHRmGE0KO/gw3O9KY7yGY3k0b7NEpP
	zNor1Z6VyCCEsOD4+yggFh9bWkIabD0luQPz43Fw5tY99xcA/NJ4LKcEQXHAIsDUIVWOkNP0ORN
	zpKyMEupMKgKsCgNsHuJpIWnLW2YGaitJvViRsB8fLg==
X-Gm-Gg: AYBFou2OgsNYyEAhoJMaQLHTj2J/XpUp6xRuQZXW8tk6HBkLGl2Vn9rYcujGCVVJ2FR
	1+Kage4jmW/SRhBSCtI61/2EFSWmyxkh715IT9zr3JPzZbSf/eD5BkiThdF9UoMvZ2rm17Tek3y
	TuqMxlBkDCyVMeRuhOefiHKcjSJUtTHCeN2beiuWD0JnxgX4eYx62+1N2Yv1ZaqFc90qCb39qY+
	6V+ULhU8+0xQ92qt2QNZ7BtpDXF5KWpPucCeSQUGVQ7/Id/BBX2kCcrcRl9PGcnKYwkJ6ZjUh8M
	KgaOK9XGt58+D8tQfar/CVr3fVhIIcikUBUWvxVMSaW09z23+xXq8/9+3Q==
X-Received: by 2002:a05:6870:2b01:b0:45e:e061:162b with SMTP id
 586e51a60fabf-47551d489ffmr25934318fac.18.1789026305388; Thu, 10 Sep 2026
 00:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAJh9TS+k9P7bpa5gW+XV_da6JvA6TOGFJEdmsEmAULNAiZTBaQ@mail.gmail.com>
 <CAJh9TSJWr8eLG=9_UjwdOqwUqfsCxaAJb8NUUJ9NKjnmPcLSPA@mail.gmail.com>
 <CAPx+jO9x304geo422e6PGNGPNsgSPAKcqUUyX244jOwy7fNw3w@mail.gmail.com> <CAJh9TSK0CJPWGFQYFcWmA4TqcZuDTdrmOduBzZHVgSQVomCZeg@mail.gmail.com>
In-Reply-To: <CAJh9TSK0CJPWGFQYFcWmA4TqcZuDTdrmOduBzZHVgSQVomCZeg@mail.gmail.com>
From: Jimmy Ho <jimmy.ho@sifive.com>
Date: Thu, 10 Sep 2026 15:44:52 +0800
X-Gm-Features: AcwNN1XrFJJTL3ipjcKqIUHM0832yy0TDIMdZGOT3OIKPKa3Xb-86YgWSUQ7ysM
Message-ID: <CAJh9TS+nj4nv0qgYG-hUSZibsY2APXYx565TuXRd6OCkp81veQ@mail.gmail.com>
Subject: Re: RISC-V genpd race in OSI mode (genpd domain power_off vs firmware
 suspend call)
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Anup Patel <anup@brainfault.org>, rafael@kernel.org, daniel.lezcano@linaro.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
	ulfh@kernel.org, Greentime Hu <greentime.hu@sifive.com>, Kevin Shi <kevin.shi@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_004506_910551_20633D93 
X-CRM114-Status: GOOD (  43.56  )
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

UGluZyBvbiB0aGlzIHF1ZXN0aW9uIGlmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uLiBUaGFua3Mh
CgoKT24gTW9uLCBBdWcgMzEsIDIwMjYgYXQgOTo1M+KAr0FNIEppbW15IEhvIDxqaW1teS5ob0Bz
aWZpdmUuY29tPiB3cm90ZToKPgo+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHlvdSBhcmUg
cmVmZXJyaW5nIHRvIGEgbWVjaGFuaXNtIHNpbWlsYXIgdG8KPiBwc2NpX3ZhbGlkYXRlX3N0YXRl
X2Nvb3JkaW5hdGlvbiBpbiBQU0NJLgo+IEhvd2V2ZXIsIHRoZXJlIGlzIGEgdGltZSB3aW5kb3cg
YmV0d2VlbiB0aGUgZ2VucGQgY2FsbGluZyB0aGUKPiBwb3dlcl9vZmYgY2FsbGJhY2sgYW5kIHRo
ZSBhY3R1YWwgZXhlY3V0aW9uIG9mCj4gcHNjaV92YWxpZGF0ZV9zdGF0ZV9jb29yZGluYXRpb24u
Cj4gRHVyaW5nIHRoaXMgd2luZG93LCBhbm90aGVyIGNvcmUgY291bGQgd2FrZSB1cCwgZW50ZXIg
TGludXgsIHR1cm4gdGhlCj4gY2x1c3RlciBnZW5wZCBiYWNrIG9uLAo+IGFuZCBjb21wbGV0ZSBp
dHMgb3duIHN1c3BlbmQgc2VxdWVuY2UgYmVmb3JlIHRoZSBpbml0aWFsIGNvcmUgZmluaXNoZXMK
PiBzdXNwZW5kaW5nLgo+IENvbnNlcXVlbnRseSwgdGhlIGluaXRpYWwgY29yZSByZW1haW5zIHVu
YXdhcmUgdGhhdCBhbm90aGVyIGNvcmUgaGFkCj4gd29rZW4gdXAgZHVyaW5nIHRoYXQgaW50ZXJ2
YWwuCj4KPiBCZXN0IHJlZ2FyZHMKPiBKaW1teSBIbwo+Cj4gT24gRnJpLCBBdWcgMjgsIDIwMjYg
YXQgODo1NeKAr1BNIFVsZiBIYW5zc29uCj4gPHVsZi5oYW5zc29uQG9zcy5xdWFsY29tbS5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgQXVnIDI4LCAyMDI2IGF0IDc6MDPigK9BTSBKaW1teSBI
byA8amltbXkuaG9Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFJlc2VuZGluZyB0aGlz
IGZvbGxvdy11cCB0byBVbGbigJlzIGN1cnJlbnQgYWRkcmVzcwo+ID4gPgo+ID4gPiBPbiBGcmks
IEF1ZyAyOCwgMjAyNiBhdCAxMjo1NuKAr1BNIEppbW15IEhvIDxqaW1teS5ob0BzaWZpdmUuY29t
PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpIGxpbnV4LXBtLAo+ID4gPiA+Cj4gPiA+ID4gV2Ug
aGl0IGEgcmFjZSBjb25kaXRpb24gaW52b2x2aW5nIGdlbnBkJ3MgQ1BVIFBNIGRvbWFpbiAoT1NJ
LW1vZGUKPiA+ID4gPiBoaWVyYXJjaGljYWwgY3B1aWRsZSwgc2ltaWxhciB0byB0aGUgQVJNIFBT
Q0kgT1NJIG1vZGVsKSBvbiBhIFJJU0MtVgo+ID4gPiA+IHBsYXRmb3JtLCBhbmQgd291bGQgbGlr
ZSB0byBnZXQgeW91ciBvcGluaW9uIG9uIHdoZXRoZXIgdGhpcyBpcyBhCj4gPiA+ID4gZ2VucGQt
bGV2ZWwgaXNzdWUgYW5kIHdoYXQgdGhlIHByZWZlcnJlZCBnZW5lcmljIGZpeCB3b3VsZCBsb29r
IGxpa2UuCj4gPiA+ID4KPiA+ID4gPiBCYWNrZ3JvdW5kCj4gPiA+ID4gLS0tLS0tLS0tLQo+ID4g
PiA+IE9ic2VydmVkIHRoaXMgaXNzdWUgb24gcWVtdSBwbGF0Zm9ybQo+ID4gPiA+IE9uIG91ciBT
b0MsIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jIHJlZ2lzdGVycyBhIGdl
bnBkCj4gPiA+ID4gbm90aWZpZXIgdG8gc2F2ZS9yZXN0b3JlIHRoZSBTLW1vZGUgQVBMSUMgY29u
dGV4dDoKPiA+ID4gPgo+ID4gPiA+ICAgYXBsaWNfbm90aWZpZXIoKQo+ID4gPiA+ICAgICBHRU5Q
RF9OT1RJRllfUFJFX09GRiAtPiBhcGxpY19zYXZlKCkKPiA+ID4gPiAgICAgR0VOUERfTk9USUZZ
X09OICAgICAgLT4gYXBsaWNfcmVzdG9yZSgpCj4gPiA+ID4KPiA+ID4gPiBDUFVzIGFyZSBhdHRh
Y2hlZCB0byB0aGlzIGdlbnBkIHZpYSBkdF9pZGxlX2F0dGFjaF9jcHUoKSAoYXMgaW4KPiA+ID4g
PiBkcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYywgbWlycm9yaW5nIGNwdWlkbGUt
cHNjaS5jKS4gV2hlbgo+ID4gPiA+IHRoZSBsYXN0IENQVSBpbiB0aGUgZG9tYWluIGdvZXMgaWRs
ZSwgZ2VucGRfcG93ZXJfb2ZmKCkgZGVjaWRlcyB0aGUKPiA+ID4gPiBkb21haW4gY2FuIGJlIHR1
cm5lZCBvZmYgKGJhc2VkIG9uIHRoZSAibm90X3N1c3BlbmRlZCIgY291bnQgY29tcHV0ZWQKPiA+
ID4gPiB1bmRlciBnZW5wZF9sb2NrKS4gV2hlbiB0aGUgZmlyc3QgQ1BVCj4gPiA+ID4gcmVzdW1l
cywgZ2VucGRfcG93ZXJfb24oKSBkZWNpZGVzIHRvIHR1cm4gdGhlIGRvbWFpbiBiYWNrIG9uIGFu
ZCBmaXJlcwo+ID4gPiA+IEdFTlBEX05PVElGWV9PTiwgd2hpY2ggdHJpZ2dlcnMgYXBsaWNfcmVz
dG9yZSgpLgo+ID4gPiA+Cj4gPiA+ID4gSG93ZXZlciwgdGhlIGFjdHVhbCBTQkkgSFNNIHN1c3Bl
bmQgY2FsbCAocmlzY3Zfc2JpX2hhcnRfc3VzcGVuZCgpLAo+ID4gPiA+IHNpbWlsYXIgdG8gYSBQ
U0NJIENQVV9TVVNQRU5EIGNhbGwpIGlzICpub3QqIGlzc3VlZCBpbnNpZGUKPiA+ID4gPiBnZW5w
ZF9sb2NrLiBnZW5wZCdzIHBvd2VyX29mZigpIGNhbGxiYWNrIG9ubHkgcmVjb3JkcyB3aGljaCBk
b21haW4KPiA+ID4gPiBpZGxlIHN0YXRlIHdhcyBzZWxlY3RlZDsgdGhlIHJlYWwgZmlybXdhcmUg
c3VzcGVuZCBjYWxsIGhhcHBlbnMgbGF0ZXIsCj4gPiA+ID4gYXN5bmNocm9ub3VzbHksIG9uIGVh
Y2ggQ1BVJ3Mgb3duIGNwdWlkbGUgZW50ZXIgcGF0aAo+ID4gPiA+IChfX3NiaV9lbnRlcl9kb21h
aW5faWRsZV9zdGF0ZSgpKS4KPiA+ID4gPgo+ID4gPiA+IFRoZSByYWNlCj4gPiA+ID4gLS0tLS0t
LS0KPiA+ID4gPiBCZWNhdXNlIG9mIHRoaXMgZ2FwIGJldHdlZW4gImdlbnBkJ3Mgc29mdHdhcmUg
ZGVjaXNpb24gdGhhdCB0aGlzIENQVQo+ID4gPiA+IGlzIGxhc3QtbWFuIC8gZmlyc3QtbWFuIiBh
bmQgInRoZSBDUFUgYWN0dWFsbHkgaXNzdWluZyB0aGUgZmlybXdhcmUKPiA+ID4gPiBzdXNwZW5k
L3Jlc3VtZSBjYWxsIiwgd2Ugb2JzZXJ2ZWQgdGhlIGZvbGxvd2luZyBzZXF1ZW5jZQo+ID4gPiA+
Cj4gPiA+ID4gMS4gQ1BVMCByZXF1ZXN0cyBhIHN5c3RlbSBkb21haW4tbGV2ZWwgcG93ZXItZ2F0
ZSAoZGVlcCBzbGVlcCwgdGVhcnMgZG93biB0aGUKPiA+ID4gPiAgICBzaGFyZWQgUy1tb2RlIEFQ
TElDIGNvbnRleHQpIGFuZCBoYW5kcyBvZmYgdG8gZmlybXdhcmUuCj4gPiA+ID4gMi4gQmVmb3Jl
IENQVTAncyByZXF1ZXN0IGlzIHBoeXNpY2FsbHkgY29tcGxldGVkLCBDUFUxIHdha2VzIHVwLAo+
ID4gPiA+ICAgIGdlbnBkX3Bvd2VyX29uKCkgcnVucywgR0VOUERfTk9USUZZX09OIGZpcmVzLCBh
cGxpY19yZXN0b3JlKCkgcnVucy4KPiA+ID4gPiAzLiBDUFUxIGdvZXMgaWRsZSBhZ2FpbiwgYnV0
IHRoaXMgdGltZSBzeXN0ZW0gZG9tYWluLWxldmVsIGdlbnBkIHJlamVjdAo+ID4gPiA+ICAgIHJl
cXVlc3QsIHNvIGl0IGZhbGxiYWNrIHRvIGNvcmUgbGV2ZWwgcG93ZXItZ2F0ZQo+ID4gPiA+IDQu
IENQVTAncyBvcmlnaW5hbCBzeXN0ZW0gZGVlcCBwb3dlci1nYXRlIHJlcXVlc3QgZXZlbnR1YWxs
eSBjb21wbGV0ZXMgYXQgdGhlCj4gPiA+ID4gICAgZmlybXdhcmUgbGV2ZWwgLS0gcGh5c2ljYWxs
eSBjb2xsYXBzaW5nIHRoZSBzeXN0ZW0gZG9tYWluLCBpbmNsdWRpbmcgdGhlCj4gPiA+ID4gICAg
Uy1tb2RlIEFQTElDIGNvbnRleHQsIHNhdmVkIGVhcmxpZXIgYnkgYXBsaWNfc2F2ZSgpCj4gPiA+
ID4gNS4gQ1BVMCB3YWtlcyB1cCAoZS5nLiBVQVJUIGludGVycnVwdCksIGVudGVycyBMaW51eCwg
YnV0IHN5c3RlbSBnZW5wZCdzCj4gPiA+ID4gICAgc29mdHdhcmUgc3RhdGUgc3RpbGwgc2F5cyB0
aGUgZG9tYWluIGlzICJvbiIgKGZyb20gc3RlcCAyKSwgc28gc3lzdGVtIGRvbWFpbgo+ID4gPiA+
ICAgIEdFTlBEX05PVElGWV9PTiB3aWxsIG5vdCBiZSBmaXJlZCBhZ2FpbiBhbmQgYXBsaWNfcmVz
dG9yZSgpIHdpbGwgbm90IGJlCj4gPiA+ID4gICAgY2FsbGVkCj4gPiA+ID4KPiA+ID4gPiBUaGlz
IGxvb2tzIHN0cnVjdHVyYWxseSBpZGVudGljYWwgdG8gdGhlIHJhY2UgVEYtQSdzIFBTQ0kgT1Mt
aW5pdGlhdGVkCj4gPiA+ID4gbW9kZSBkb2N1bWVudGF0aW9uIGRlc2NyaWJlczoKPiA+ID4gPiBo
dHRwczovL3RydXN0ZWRmaXJtd2FyZS1hLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9kZXNpZ25f
ZG9jdW1lbnRzL3BzY2lfb3NpX21vZGUuaHRtbCNyYWNlcy1pbi1vcy1pbml0aWF0ZWQtbW9kZQo+
ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAgICJJbiBPUy1pbml0aWF0ZWQgbW9kZSwgdGhlcmUgYXJl
IHJhY2Ugd2luZG93cyB3aGVyZSB0aGUgT1MncyB2aWV3Cj4gPiA+ID4gICBhbmQgaW1wbGVtZW50
YXRpb24ncyB2aWV3IG9mIHRoZSBzeXN0ZW0ncyBzdGF0ZSBkaWZmZXIuLi4gdGhlIE9TCj4gPiA+
ID4gICBtaWdodCByZXF1ZXN0IGEgcG93ZXJkb3duIHN0YXRlIGZvciBhIG5vZGUgZnJvbSBvbmUg
Y29yZSwgd2hpbGUgYXQKPiA+ID4gPiAgIHRoZSBzYW1lIHRpbWUsIHRoZSBpbXBsZW1lbnRhdGlv
biBvYnNlcnZlcyB0aGF0IGFub3RoZXIgY29yZSBpbgo+ID4gPiA+ICAgdGhhdCBub2RlIGlzIHBv
d2VyaW5nIHVwLiIKPiA+ID4gPgo+ID4gPiA+IFRGLUEncyBhbnN3ZXIgaXMgdG8gcmVxdWlyZSB0
aGUgT1MgdG8gZW5jb2RlIGEgImxhc3RfYXRfcHdybHZsIiBmaWVsZAo+ID4gPiA+IGludG8gdGhl
IFN0YXRlSUQgcGFzc2VkIHRvIENQVV9TVVNQRU5ELCB3aGljaCBmaXJtd2FyZSB2YWxpZGF0ZXMK
PiA+ID4gPiBhZ2FpbnN0IGl0cyBvd24gdmlldyBvZiBzeXN0ZW0gc3RhdGUgYmVmb3JlIGhvbm9y
aW5nIGEgcG93ZXJkb3duCj4gPiA+ID4gcmVxdWVzdC4gV2UgY291bGQgbm90IGZpbmQgYW55IGNv
ZGUgaW4gY3VycmVudCBtYWlubGluZSBMaW51eAo+ID4gPiA+IChjcHVpZGxlLXBzY2kuYyBvciBn
ZW5lcmljIGNwdWlkbGUvZ2VucGQgY29kZSkgdGhhdCBhY3R1YWxseSBjb21wdXRlcwo+ID4gPiA+
IGFuZCBlbmNvZGVzIHRoaXMgZmllbGQgZHluYW1pY2FsbHkgcGVyIHN1c3BlbmQgY2FsbCwgc28g
YXMgZmFyIGFzIHdlCj4gPiA+ID4gY2FuIHRlbGwgdGhpcyByYWNlIGlzIHVuaGFuZGxlZCBnZW5l
cmljYWxseSB0b2RheSwgb24gYm90aCBhcm0vcHNjaQo+ID4gPiA+IGFuZCByaXNjdi9zYmkgYmFj
a2VuZHMuCj4gPiA+ID4KPiA+ID4gPiBPcHRpb25zIHdlIGNvbnNpZGVyZWQKPiA+ID4gPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gMS4gSW1wbGVtZW50IHNvbWV0aGluZyBsaWtlIFBT
Q0kncyBsYXN0X2F0X3B3cmx2bCBnZW5lcmljYWxseTogZXhwb3NlCj4gPiA+ID4gICAgZ2VucGQn
cyBhbHJlYWR5LWNvbXB1dGVkICJhbSBJIHRoZSBsYXN0IENQVSBpbiB0aGlzIGRvbWFpbiIKPiA+
ID4gPiAgICBpbmZvcm1hdGlvbiB0aHJvdWdoIHRoZSBwb3dlcl9vZmYoKSBjYWxsYmFjayBBUEks
IHNvCj4gPiA+ID4gICAgYmFja2VuZHMgY2FuIHBhc3MgaXQgZG93biB0byBmaXJtd2FyZSwgYW5k
IGhhdmUgZmlybXdhcmUgdmFsaWRhdGUvCj4gPiA+ID4gICAgcmVqZWN0IHN0YWxlIHJlcXVlc3Rz
Lgo+ID4gPiA+ICAgIC0gUHJvOiBtYXRjaGVzIHRoZSBkb2N1bWVudGVkIFBTQ0kgT1NJIGFwcHJv
YWNoLgo+ID4gPiA+ICAgIC0gQ29uOiBXZSBkb24ndCBrbm93IGhvdyB0byBzZXQgdGhpcyBmbGFn
IHByb3Blcmx5IGluIGEgZ2VuZXJpYyB3YXkuCj4gPiA+ID4gICAgICBsYXN0X2F0X3B3cmx2bCBp
cyBvbmx5IG1lYW5pbmdmdWwgb24gcmlzY3YvYXJtLCBzbyB3ZSBjYW4ndCBqdXN0Cj4gPiA+ID4g
ICAgICBhZGQgaXQgdG8gZ2VucGQncyBnZW5lcmljIGNvZGUgcGF0aC4gZ2VucGQgYWxzbyBkb2Vz
bid0IGtlZXAgYQo+ID4gPiA+ICAgICAgY291bnRlciBvZiBob3cgbWFueSBDUFVzIGluIGEgZG9t
YWluIGFyZSBzdGlsbCBhbGl2ZSwgc28gdGhlcmUncwo+ID4gPiA+ICAgICAgbm8gZXhpc3Rpbmcg
c3RhdGUgaW4gZ2VucGQncyBwb3dlcl9vZmYoKSBjYWxsYmFjayB3ZSBjb3VsZCByZWFkCj4gPiA+
ID4gICAgICB0byBkZXJpdmUgdGhlIGZsYWcuIE9uZSBpZGVhIHdvdWxkIGJlIHRvIHdhbGsgdGhl
IGdlbnBkIGhpZXJhcmNoeQo+ID4gPiA+ICAgICAgZnJvbSB3aXRoaW4gdGhlIHBvd2VyX29mZigp
IGNhbGxiYWNrIGFuZCBjaGVjayB0aGUgcnVudGltZV9zdGF0dXMKPiA+ID4gPiAgICAgIG9mIGVh
Y2ggQ1BVIGRldmljZSBpbiB0aGUgc2FtZSBkb21haW4gKGdlbnBkIGRvbWFpbnMgYWxyZWFkeSBj
YXJyeQo+ID4gPiA+ICAgICAgYSBDUFUgbWFzaywgYW5kIGdldF9jcHVfZGV2aWNlKCkgY2FuIGJl
IHVzZWQgdG8gbG9vayB1cCB0aGUKPiA+ID4gPiAgICAgIGNvcnJlc3BvbmRpbmcgQ1BVIGRldmlj
ZSkKPiA+ID4gPgo+ID4gPiA+IDIuIERvIHRoZSBwb3dlci1kb21haW4gY29udHJvbCBkaXJlY3Rs
eSBmcm9tIHRoZSBwb3dlcl9vZmYoKS9wb3dlcl9vbigpCj4gPiA+ID4gICAgZ2VucGQgY2FsbGJh
Y2tzIChlLmcuIGhhdmUgdGhlbSBwb2tlIHRoZSBTb0MncyBwb3dlciBjb250cm9sbGVyCj4gPiA+
ID4gICAgcmVnaXN0ZXJzIHZpYSBhbiBTQkkgY2FsbCwgaW5zdGVhZCBvZiByZWx5aW5nIG9uIGVh
Y2ggQ1BVJ3Mgb3duCj4gPiA+ID4gICAgaWRsZS1lbnRyeSBwYXRoIHRvIHRyaWdnZXIgdGhlIGRl
ZXBlc3Qgc3RhdGUpLgo+ID4gPiA+ICAgIGl0IGNyZWF0ZXMgdHdvIGluZGVwZW5kZW50IGRyaXZl
ciB0aGF0IHdpbGwgdG91Y2ggcG93ZXIgY29udHJvbGxlcgo+ID4gPiA+ICAgIChvcGVuc2JpIHZz
IGxpbnV4KQo+ID4gPiA+Cj4gPiA+ID4gMy4gSGF2ZSBlYWNoIENQVSBwYXNzIGEgbW9ub3Rvbmlj
YWxseSBpbmNyZWFzaW5nIHNlcXVlbmNlIG51bWJlcgo+ID4gPiA+ICAgIGFsb25nc2lkZSBpdHMg
c3VzcGVuZCByZXF1ZXN0IHRvIGZpcm13YXJlLCBhbmQgaGF2ZSBmaXJtd2FyZQo+ID4gPiA+ICAg
IGl0c2VsZiBkZXRlY3QgYW5kIHJlamVjdC9kb3duZ3JhZGUgYSBkZWVwIHBvd2VyLWRvd24gcmVx
dWVzdCBpZiBhCj4gPiA+ID4gICAgKm5ld2VyKiBzZXF1ZW5jZSBudW1iZXIgZnJvbSBhIHNoYWxs
b3dlciAoaS5lLiAic29tZSBDUFUgYmVjYW1lCj4gPiA+ID4gICAgYWN0aXZlIGFnYWluIikgcmVx
dWVzdCBoYXMgYmVlbiBvYnNlcnZlZCBmb3IgdGhlIHNhbWUgZG9tYWluIHNpbmNlLgo+ID4gPiA+
ICAgIFRoaXMgaXMgYSBmaXJtd2FyZS1zaWRlIHN0YWxlbmVzcyBjaGVjaywgZW50aXJlbHkgYmVs
b3cgdGhlIFNCSQo+ID4gPiA+ICAgIGNhbGwgYm91bmRhcnkKPiA+ID4gPiAgICB0aGlzIHNlcSBu
dW1iZXIgY2FuIGJlIG1haW50YWluZWQgaW4gZ2VuZHBkIGdlbmVyaWMgY29kZQo+ID4gPiA+ICAg
IG9yIHJpc2N2IHBvd2VyX29mZigpIGNhbGxiYWNrLCB3aGVyZSBkbyB5b3Ugc3VnZ2VzdCB0aGlz
IHRvIGJlCj4gPiA+ID4gICAgYWRkZWQ/Cj4gPiA+ID4KPiA+ID4gPiBEbyB5b3UgaGF2ZSBhbnkg
c3VnZ2VzdGlvbiB0byBzb2x2aW5nIHRoaXMgaXNzdWU/Cj4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+
IEppbW15IEhvCj4gPgo+ID4gVGhlIHByb2JsZW0gc2VlbXMgdmVyeSBzaW1pbGFyIHRvIHRoZSBy
YWNlIGNvbmRpdGlvbiB3ZSBoYXZlIGZvciB0aGUKPiA+IFBTQ0kgT1NJIG1vZGUuIFRoaXMgcmFj
ZSBjb25kaXRpb24gbmVlZHMgdG8gYmUgbWFuYWdlZCBpbiB0aGUgRlcuCj4gPgo+ID4gSWYgdGhl
IGxhc3QgQ1BVIGluIGEgY2x1c3RlciBpcyBhYm91dCB0byBlbnRlciBpZGxlLCB0aGUgRlcgc2lt
cGx5Cj4gPiBuZWVkcyB0byBhYm9ydCB0aGUgcmVxdWVzdCBmb3IgaXQsIGlmIHRoZXJlIGlzIGFu
b3RoZXIgQ1BVIGluIHRoZSBzYW1lCj4gPiBjbHVzdGVyIHRoYXQgaXMgYWJvdXQgdG8gd2FrZSB1
cC4KPiA+Cj4gPiBLaW5kIHJlZ2FyZHMKPiA+IFVmZmUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
