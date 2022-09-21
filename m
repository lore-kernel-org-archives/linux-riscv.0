Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3C6C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LVCbPzUrNOFT9TJaCqk6DqYsDyZwjVi1JV58N0XVwtU=; b=CyO5PbV3dljuERzNw91UpQZ6Pv
	LQdXy+H20vbM9oSmqBzf5HUpkXyf+n3ttz/LZt7pt/vp2A0FYU06o1cowF5rSOyGhELOQVhZK+PjS
	OUMg6njuZsBdesy6K+KkU8AZSxv9jS1cT6pMZHCyeilRr/o2yNqeif3cwV/fizyEW5Egu9E9Cf+kZ
	FZrxfGA3ejVvdYGyDeHE5yE14e8xqLYqWgo0J55JOledJ5eyR7ukxVobdiAirp0bugASrCZQywGws
	q8BZU8X7LtuBoZ9Tlv/7vCGwSOByQzdOHInFRRSKRHWRvQ16JhNwmOExh8MwuJ5DvYMKpClDEQcCV
	IuUHxPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6HQ-00CaJp-Qo; Wed, 21 Sep 2022 20:25:12 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6HL-00CaJK-J7
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 20:25:11 +0000
Received: by mail-pf1-x432.google.com with SMTP id l65so7101777pfl.8
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 13:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=sqG2AIDQKKDIE+aKBMVPmM2IG52evSEYbtT3naoareY=;
        b=BBSldU+bSB4OlpR9ZugkdEuCgPBnKNc+8QbIKCogH4mDwvWJ9SnKnG2omcEjKB4djJ
         Tih3+qSVPrty+9QPwr2RGb/XzY++8EKchwWodpep1/VYX3d6IO41WIL7wK3js2pSq1je
         tXfGQwpOgAWMDbIov1mD+/XnKLu0nQzYOom2W+IwKC8+Oq/pn2qAQKAMb2ApWwFd+SIT
         HsWpb5ULu6TZqVKmW44N2UeOxmqFihUWiChncYu3TOvzxVznBE/CW+cQz83GqpUQkVkg
         q6Mi0tGHmMuVGrXSFiXABJooHQr0egYvAIZ3MYbprwMJERtGe+okOe/oMz1w7zprMfc6
         xRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=sqG2AIDQKKDIE+aKBMVPmM2IG52evSEYbtT3naoareY=;
        b=awbYEWaHg6Hhz/GIZPlpmfZicXx6SkLt6xHQ6rgWwpd5p+5+HWm+8YOZkPw6saW+xU
         VyA/4ZZcb3Lkxl7spAbpzh7ZOcmKXmkZSGElPznx90xuZ8arTdIgi3xYs3zTyJ7NKwhx
         Gmx9ZGADeeroG6pdPfqoVOXZTCk4FOPv26NdiXjpSuu8lFf+43dhl0ci6Y8Pvmt/+1mX
         sojDrEyyK3MqPjiUbayzsPXhM/C0bPpCqZqMzYIo7fLeURM9cGqTRLJo5T8pWH3LDzm3
         UXrTzLBCwgentvv6FIlOuayUb4Bzu4b6gY+U4XKwPlqbV9SOOCvvM7d3TvHrKQJIuR4m
         lqKg==
X-Gm-Message-State: ACrzQf1SHowHmMelu1WTIor47l5Q5IePTNiXpc97jnoqK+gg98NC/JOb
	c0JqdXU3NJoCDywVG20n1Ziq9Q==
X-Google-Smtp-Source: AMsMyM6o8G1z4hT/AOp7wIZTc+0oakeB6QJKQLscLYOK+iFgjuptTVMCsMqJ0+ePeCH5Dpd7ApeZtQ==
X-Received: by 2002:a05:6a00:3392:b0:547:f861:1fad with SMTP id cm18-20020a056a00339200b00547f8611fadmr31009348pfb.16.1663791905942;
        Wed, 21 Sep 2022 13:25:05 -0700 (PDT)
Received: from localhost (p200300ee3707fe003af25da13a798889.dip0.t-ipconnect.de. [2003:ee:3707:fe00:3af2:5da1:3a79:8889])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902ea1100b00176b5035045sm2419819plg.202.2022.09.21.13.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 13:25:04 -0700 (PDT)
Date: Wed, 21 Sep 2022 13:25:04 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Sep 2022 08:31:52 PDT (-0700)
Subject: Re: [PATCH -next v2 2/2] riscv: extable: add new extable type EX_TYPE_KACCESS_ERR_ZERO support
In-Reply-To: <301cd27e-d003-584b-2eb0-8fa025348cff@huawei.com>
CC: ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Conor.Dooley@microchip.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com, guohanjun@huawei.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: tongtiangen@huawei.com
Message-ID: <mhng-b5608339-68e0-4706-9002-50ba006b4d05@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_132507_652704_B66FB19A 
X-CRM114-Status: GOOD (  22.62  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAyNyBBdWcgMjAyMiAwMzozOTozOCBQRFQgKC0wNzAwKSwgdG9uZ3RpYW5nZW5AaHVh
d2VpLmNvbSB3cm90ZToKPgo+Cj4g5ZyoIDIwMjIvOC8yNiAxNjoxNiwgQW5kcmV3IEpvbmVzIOWG
memBkzoKPj4gT24gRnJpLCBBdWcgMjYsIDIwMjIgYXQgMDI6NDQ6NDhQTSArMDgwMCwgVG9uZyBU
aWFuZ2VuIHdyb3RlOgo+Pj4KPj4+Cj4+PiDlnKggMjAyMi84LzI1IDE5OjA2LCBBbmRyZXcgSm9u
ZXMg5YaZ6YGTOgo+Pj4+IE9uIE1vbiwgQXVnIDE1LCAyMDIyIGF0IDAzOjIwOjI1QU0gKzAwMDAs
IFRvbmcgVGlhbmdlbiB3cm90ZToKPj4+Pj4gQ3VycmVudGx5LCBUaGUgZXh0YWJsZSB0eXBlIEVY
X1RZUEVfVUFDQ0VTU19FUlJfWkVSTyBpcyB1c2VkIGJ5Cj4+Pj4+IF9fZ2V0L3B1dF9rZXJuZWxf
bm9mYXVsdCgpLCBidXQgdGhvc2UgaGVscGVycyBhcmUgbm90IHVhY2Nlc3MgdHlwZSwgc28gd2UK
Pj4+Pj4gYWRkIGEgbmV3IGV4dGFibGUgdHlwZSBFWF9UWVBFX0tBQ0NFU1NfRVJSX1pFUk8gd2hp
Y2ggY2FuIGJlIHVzZWQgYnkKPj4+Pj4gX19nZXQvcHV0X2tlcm5lbF9ub19mYXVsdCgpLgo+Pj4+
Pgo+Pj4+PiBPbmx5IHJlZmFjdG9yIGNvZGUgd2l0aG91dCBhbnkgZnVuY3Rpb25hbCBjaGFuZ2Vz
Lgo+Pj4+Cj4+Pj4gVGhpcyBpc24ndCBxdWl0ZSB0cnVlLiBfX2dldC9wdXRfa2VybmVsX25vZmF1
bHQgbm93IHNldHMgYSBkaWZmZXJlbnQKPj4+PiBleHRhYmxlIHR5cGUgKGFzIHRoZSBjb21taXQg
bWVzc2FnZSBzYXlzKS4gQnV0LCBub3RoaW5nIHNwZWNpYWwgc2VlbXMKPj4+PiB0byBiZSBkb25l
IHdpdGggdGhhdCwgc28gdGhlcmUncyBlZmZlY3RpdmVseSBubyBmdW5jdGlvbmFsIGNoYW5nZS4g
Q2FuCj4+Pj4geW91IHBsZWFzZSBlbGFib3JhdGUgb24gdGhlIG1vdGl2YXRpb24gZm9yIHRoaXMg
Y2hhbmdlPyBXaGVyZSB3aWxsIHRoZQo+Pj4+IEtBQ0NFU1MgdHlwZSBuZWVkIHRvIGJlIGRpc3Rp
bmd1aXNoZWQgZnJvbSB0aGUgVUFDQ0VTUyB0eXBlPwo+Pj4KPj4+IFRoZSBpbnRyb2R1Y3Rpb24g
b2YgRVhfVFlQRV9LQUNDRVNTX0VSUl9aRVJPIGRvZXMgbm90IGNoYW5nZSBhbnkgZnVuY3Rpb24s
Cj4+PiBidXQgbWFrZXMgYSBjb3JyZWN0IGRpc3RpbmN0aW9uIGluIHRoZSBhY3R1YWwgdHlwZSwg
aW5kaWNhdGluZyB0aGF0IHRoZXJlCj4+PiBhcmUgaW5kZWVkIHNvbWUga2FjY2VzcyBlbnRyaWVz
IGluIGV4dGFibGUuIEkgdGhpbmsgdGhpcyBvcHRpbWl6YXRpb24gaXMKPj4+IG1vcmUgY2xlYXIg
YW5kIHJlYXNvbmFibGUuCj4+Cj4+IFdlbGwsIGNyZWF0aW5nIG5ldyB0eXBlcywganVzdCBmb3Ig
bmV3IHR5cGUgc2FrZSwganVzdCBibG9hdHMgY29kZS4KPj4KPj4+Cj4+PiBBIGZldyB3ZWVrcyBh
Z28sIEkgZGlkIHNvbWV0aGluZyBzaW1pbGFyIG9uIGFybTY0WzFdLiBJIHRoaW5rIHRoaXMKPj4+
IG9wdGltaXphdGlvbiBjYW4gYWxzbyBiZSB1c2VkIG9uIHJpc2N2Lgo+Pj4KPj4+IFdlIGNhbiBk
byBzb21lIGZlYXR1cmVzIHRoYXQgYXJlIHVzZWQgb24gdWFjY3NzIGJ1dCBub3QgYXBwbGljYWJs
ZSBvbgo+Pj4ga2FjY2VzcyBpbiB0aGUgZnV0dXJlWzJdLgo+Pj4KPj4+IFsxXQo+Pj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMDYyMTA3MjYzOC4xMjczNTk0LTItdG9uZ3RpYW5n
ZW5AaHVhd2VpLmNvbS8KPj4+IFsyXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMjA4
MTIwNzA1NTcuMTAyODQ5OS00LXRvbmd0aWFuZ2VuQGh1YXdlaS5jb20vCj4+Pgo+Pgo+PiBUaGlz
IGlzIHBhcnQgb2YgdGhlIGluZm9ybWF0aW9uLCBidXQgSSBoYWQgYWxyZWFkeSBmb3VuZCB0aGlz
LiBXaGF0J3MKPj4gc3RpbGwgbWlzc2luZyB0byBtZSBhcmUgdGhlIHJpc2N2IHBhdGNoZXMsIG9y
IGF0IGxlYXN0IGEgcmlzY3YgcGxhbiwgZm9yCj4+IGFjdHVhbGx5IGltcGxlbWVudGluZyBzb21l
dGhpbmcgd2hpY2ggcmVxdWlyZXMga2FjY2VzcyBhbmQgdWFjY2VzcyB0byBoYXZlCj4+IGRpc3Rp
bmN0IHR5cGVzLgo+Pgo+PiBUaGFua3MsCj4+IGRyZXcKPgo+IEF0IHByZXNlbnQsIHRoZXJlIGlz
IG5vIHN1Y2ggcGxhbiBvbiByaXNjdiwgYmVjYXVzZSBpdCBpcyByZWx5IG9uCj4gaGFyZHdhcmUg
c3VwcG9ydC4KPiBJIHRoaW5rIHRoaXMgcGF0Y2ggY2FuIGJlIG1lcmdlZCBhcyBhIHNtYWxsIGNv
ZGUgb3B0aW1pemF0aW9uIGFuZAo+IHdpdGhvdXQgYW55IGZ1bmN0aW9uIGNoYW5nZS4KCkdlbmVy
YWxseSB3ZSBuZWVkIHNvbWUgdXNlIG9mIHRoZSBjb2RlIGluIHRoZSB1cHN0cmVhbSBrZXJuZWwg
dG8ganVzdGlmeSAKaXRzIGV4aXN0ZW5jZS4gIEluIHRoaXMgY2FzZSBJIGRvbid0IHJlYWxseSBz
ZWUgdGhhdDogaXQncyBqdXN0IGFub3RoZXIgCnR5cGUgdGhhdCdzIGV4YWN0bHkgdGhlIHNhbWUg
YXMgdGhlIGV4aXN0aW5nIG9uZSwgaGF2aW5nIHNvbWUgb3V0IG9mIAp0cmVlIGNvZGUgdGhhdCBk
ZXBlbmRzIG9uIG1ha2luZyB0aGVzZSB0eXBlcyBkbyBzb21ldGhpbmcgZGlmZmVyZW50IAppc24n
dCBhIHN1ZmZpY2llbnQganVzdGlmaWNhdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
