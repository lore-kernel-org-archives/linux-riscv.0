Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0EEC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fakEot1gicjd4A4PxuYl9a6IWr9V32hBo89sG10796c=; b=LDOKR7t1kFdAZv
	11/T4TxHyxtT5Zp0LNYC3Hrk2Om0IuJbHns9LD1oZuRL8Mx0E+NWEXAzDHBU9NR7YKJPpHP7DnKtj
	LKStq4l6GNYJ6wzqTYtPFnQ6vQfLAHI8LCkgJ5dyHh4JvhutyaOqqY6jMz8lEFP7h8CVS2iUFPtpP
	stUP0wd4MKwA9gljnKM36ukBIEd3PRvZ2OPyfrOfAI2Wz5x6BHitDGTRC/MYqUo9Pw5H6GFRv3Cxs
	Fp5bEcwgvLxNkR+qvK6YXCuRXaPP52JGZn8nSVOa+NaYnMv2pEaXx3KGWt8zzD4aNka+tQQW+4hPq
	j4sCkA5Wd3U7sBtCaL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgQJ-004LAc-2C;
	Fri, 24 Mar 2023 12:21:35 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfgQG-004L9j-23
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 12:21:34 +0000
Received: by mail-ed1-x531.google.com with SMTP id x3so7164260edb.10
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 05:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1679660488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctStgQWNpQ/Re1wsx9j5lT9zwZ5wXDVWbyuukQgMDcA=;
        b=fpX1bAWiL4S1S9g/yT8c4XlQmU9bu8se8wJ9AqOntdwwjKrnAjiXA4vYbnek5smO2L
         XcHqbhlzZ8mQvA84b0q053ghwXrE7xSFiA9v7Avr+l/hz3UG0BU4YqhY0RRozjyHyvmj
         bzBfCxWu0MKFH1G9F1UgK0EOCjqOdfDLOvfXS2Jfb8AiqnjgBcYkUGI1S9++g8HJ+VST
         B0m0BAEAlIWXTUaz2hPNv577sX67N6hrgP7ybMYmz8EADDY8QHtSDJ32RToQSy6R0DI5
         u9z/i4uHFkfs4vmv9taOhQeC5Z3Sm7gOXiEwHB/XosdxEugL5RJ4fBe6AGOS/eIx9J0s
         nXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679660488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctStgQWNpQ/Re1wsx9j5lT9zwZ5wXDVWbyuukQgMDcA=;
        b=V6xDtYR5nBbJIRwXbDvqkk7l0bIcJW9wEX8tW2NIugjrmjc3lidk17H2w2bi9fBCWi
         1zis0Lu1+VdovSmN2zYsiyHf3cW+q7wy0KEzh6/w8O6FwbExw07dXHeZlejBji8U5QQt
         58ZKYRpaRlvq133ETKbAWNXaElvM60YnS8FJvAf1jy27cvqch2n5R6xZPeZHSN0CbDOf
         +CVc75NubMljiPgfIpFM5lDbEds+2mtjS9R097vRDo+/EdouBLltrkRuaXJM/gFV9dQ2
         2bWa1o2mZqOhXpOiTRpOK2Eh67YQT3jxhL2LrOgrmz0lT2JXSrsht6nZkHAfOXn/hcom
         Yuiw==
X-Gm-Message-State: AAQBX9crT7QPGanO9LMvWOeHu3Y+ImMF5qNGQTdsS6uQ80iP7vJwr8sR
	4Fux6mRZr03etvaz06AWJxGEp5hY9q4sW9yohwWdAA==
X-Google-Smtp-Source: AKy350aEhCiImASOJy4HhkyiiIYmqHsKmfTZT/59eHRVZzOUQcbiSQDlRwhAQ8MXrhL5JzPV4pTdTiht25k0HLPlh30=
X-Received: by 2002:a17:907:9623:b0:93e:aac:bb8d with SMTP id
 gb35-20020a170907962300b0093e0aacbb8dmr1069370ejc.13.1679660487901; Fri, 24
 Mar 2023 05:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
 <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud> <427628e0-4c6d-4934-b873-fa1b81b7daa0@spud>
 <20230324113259.jbfncctnclvkzjkz@orel> <a58c463e-a3f3-4a4c-8c6e-df707bbd76e0@spud>
 <20230324115658.lqkdsdzntorchmso@orel>
In-Reply-To: <20230324115658.lqkdsdzntorchmso@orel>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Mar 2023 17:51:16 +0530
Message-ID: <CAAhSdy1nMjD5EXcxvkmC_Mqjok=2Dxy3uJw1f_0kxvPzn=Pc1w@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Require alternatives
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_052132_862043_B6871BA3 
X-CRM114-Status: GOOD (  29.06  )
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

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgNToyNuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMTE6NTI6
MTNBTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gRnJpLCBNYXIgMjQsIDIwMjMg
YXQgMTI6MzI6NTlQTSArMDEwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE1h
ciAyMywgMjAyMyBhdCAwNTo1NzoxNFBNICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+
ID4gT24gV2VkLCBNYXIgMjIsIDIwMjMgYXQgMDc6NDA6MTRQTSArMDAwMCwgQ29ub3IgRG9vbGV5
IHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCBNYXIgMjIsIDIwMjMgYXQgMDg6Mjg6NTZQTSArMDEw
MCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gPiA+ID4gPiBLVk0gbWFrZXMgdXNlIG9mIHJpc2N2
X2hhc19leHRlbnNpb25fdW5saWtlbHkoKSB0byBjaGVjayBmb3IgdGhlCj4gPiA+ID4gPiA+IHN2
aW52YWwgZXh0ZW5zaW9uLiByaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KCkgaXMgYnVpbHQg
b24KPiA+ID4gPiA+ID4gYWx0ZXJuYXRpdmVzLCB3aGljaCBtZWFucyBLVk0gc2hvdWxkIGVuc3Vy
ZSBhbHRlcm5hdGl2ZXMgc3VwcG9ydAo+ID4gPiA+ID4gPiBpcyBhdmFpbGFibGUuCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IFRoZSBmaXJzdCBwYXRjaCB0YWtlcyB0aGUgb3Bwb3J0dW5pdHkgdG8g
Y2xlYW51cCBLVk0ncyBzZWxlY3QKPiA+ID4gPiA+ID4gbGlzdC4gVGhlIHNlY29uZCBwYXRjaCBz
ZWxlY3RzIFJJU0NWX0FMVEVSTkFUSVZFLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJlbWluZHMgbWUs
IEkgbmVlZCB0byByZS1zdWJtaXQgbXkgcGF0Y2ggZG9pbmcgdGhhdCBmb3IgdGhlIHRvcC1sZXZl
bAo+ID4gPiA+ID4gUklTQy1WIEtjb25maWcuLi4KPiA+ID4gPiA+IEZvciB0aGUgcGFpcjoKPiA+
ID4gPiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPgo+ID4gPiA+Cj4gPiA+ID4gQWN0dWFsbHksIEkgd291bGQgbGlrZSB0byB0YWtlIHRoaXMg
YmFjayBmb3IgcGF0Y2ggMi4KPiA+ID4gPiBQZXIgdGhlIGRpc2N1c3Npb24gb24gdGhlIG90aGVy
IHRocmVhZCBhYm91dCBYSVAgWzFdLCBJIGRvbid0IHRoaW5rCj4gPiA+ID4gdGhhdCBLVk0gc2hv
dWxkIGJlIHNlbGVjdGluZyBhbHRlcm5hdGl2ZXMgbGlrZSB0aGlzLgo+ID4gPiA+IFdvdWxkIHlv
dSBtaW5kIGlmIEkgcGlja2VkIHVwIHRoZXNlIHBhdGNoZXMgJiBzdWJtaXR0ZWQgdGhlbSBhcyBh
IHYyLAo+ID4gPiA+IGFsb25nc2lkZSBhIHBhdGNoIHRyeWluZyB0byBtYWtlIHN1cmUgdGhhdCB3
ZSBkbyBub3QgY2xpcCB0aGUgd2luZ3Mgb2YKPiA+ID4gPiBvZiBYSVAga2VybmVscyBieSBzZWxl
Y3RpbmcgUklTQ1ZfQUxURVJOQVRJVkU/Cj4gPiA+Cj4gPiA+IEhpIENvbm9yLAo+ID4gPgo+ID4g
PiBJIHRha2UgaXQgdGhhdCByZXN1Ym1pdHRpbmcgdGhlc2UgcGF0Y2hlcyBpcyBubyBsb25nZXIg
cGFydCBvZiB0aGUgcGxhbi4KPiA+Cj4gPiBBaCBjcmFwLCBzb3JyeS4gSSBtZWFudCB0byByZXBs
eSBoZXJlIGFmdGVyIHN1Ym1pdHRpbmcgYW5kIGZvcmdvdC4KPiA+Cj4gPiA+IFNob3VsZCBJIHJl
YmFzZSBvbiAiW1BBVENIIHYxIDAvMl0gUklTQy1WOiBGaXhlcyBmb3IKPiA+ID4gcmlzY3ZfaGFz
X2V4dGVuc2lvblt1bl1saWtlbHkoKSdzIGFsdGVybmF0aXZlIGRlcGVuZGVuY3kiIGFuZCBjaGFu
Z2UgdGhlCj4gPiA+IHNlbGVjdCB0byBhIGRlcGVuZHMgb24/Cj4gPgo+ID4gSSBkb24ndCB0aGlu
ayB5b3UgbmVlZCB0by4gRG9lcyBLVk0gYWN0dWFsbHkgbWFrZSB1c2Ugb2YgYWx0ZXJuYXRpdmVz
LAo+ID4gb3RoZXIgdGhhbiBmb3IgcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseSgpLCB0aGF0
IGFyZSBub3QgZ2F0ZWQgYnkKPiA+IGV4dGVuc2lvbi9lcnJhdHVtIHNwZWNpZmljIGNvbmZpZyBv
cHRpb25zPwo+ID4KPiA+IFdpdGggbXkgcGF0Y2ggMi8yLCBhbHRlcm5hdGl2ZXMgYXJlIGFsd2F5
cyBlbmFibGVkIGZvciAhWElQX0tFUk5FTAo+ID4gYnVpbGRzLCBhbmQgd2lsbCBmYWxsIGJhY2sg
dG8gdGhlICJzbG93IiBwYXRoIGluCj4gPiByaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KCkg
b3RoZXJ3aXNlLgo+ID4gSWYgS1ZNIGRvZXNuJ3QgbmVlZCBhbHRlcm5hdGl2ZXMgZm9yIGFub3Ro
ZXIgcmVhc29uLCBJIGRvbid0IHRoaW5rIHlvdQo+ID4gbmVlZCB0byBpbnRyb2R1Y2UgYSBkZXBl
bmRlbmN5IG9uIHRoZW0gYW5kIGp1c3QgaW5oZXJpdCB0aGUgZGVjaXNpb24KPiA+IG1hZGUgYnkg
Q09ORklHX1JJU0NWLgo+Cj4gQWNrLCB0aGFua3MsIENvbm9yLgo+Cj4gQW51cCwgd2UgY2FuIGVp
dGhlciBkcm9wIHBhdGNoIDIvMiBvciB0aGUgd2hvbGUgc2VyaWVzLCBhcyB5b3UgbGlrZS4KCklm
IGFsdGVybmF0aXZlcyBhcmUgZ29pbmcgdG8gYmUgYWx3YXlzIGVuYWJsZWQgZm9yICFYSVBfS0VS
TkVMIHRoZW4Kd2UgY2FuIGRyb3AgUEFUQ0gyLiBJIGFtIG9rYXkgdGFraW5nIFBBVENIMS4KClJl
Z2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
