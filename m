Return-Path: <SRS0=HRg9=H7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FDAC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 14:44:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D52AF6146D
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 14:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D52AF6146D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mRG2p2oXVCFJ0Z+hvXlqZ7/WYe2x/WZqt+TZ7J7ohms=; b=TbYMEKsls0p5tWxYZm3K6m2wK
	sepbfs0AfOhZWDQqiJhgzGiqLXwGHcxt/Apc8kdkFGB2VQGeZZgZKTYGw/uQEVHIu42gjrwmq86dk
	WdIgQA9YSR9Tv/MHM35j6co6dPoeo0GkxNR9wjb6Lw1U6C3XkKTcsRBw0FGyT6NwFFvz9n3FPWhNB
	G9FKneB8GmPl6esUZGQSW/NJpH5uYBjA02eA5LdgeleSZR6gzbQYowhOcikYUG5fKuVEratm33sBC
	HVui1Q5L1xpJgqjBs6jXDgTboLxRMquRW9m4bPkK4xYf2r+zVzCWFNOuchb2Hkr4rbqsqAyp1ymGh
	3phbXwcbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGjm2-0003Y5-Pb; Mon, 01 Mar 2021 14:43:50 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGjlw-0003VK-OJ
 for linux-riscv@lists.infradead.org; Mon, 01 Mar 2021 14:43:48 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dq2yD5YsWzMgg5;
 Mon,  1 Mar 2021 22:41:24 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Mar 2021 22:43:30 +0800
Subject: Re: question about RISCV EFI stub support
To: Atish Patra <atishp@atishpatra.org>
References: <350c7458-c77b-56de-de5e-8c96ce9c16ae@huawei.com>
 <CAOnJCU+v=O1u1yK0UD7JYJAhzGmFmCLQk4yP8aZuJX-QoT5UWg@mail.gmail.com>
 <89b97904-e069-35cd-0a42-217cafe17e15@huawei.com>
 <CAOnJCU+HWA2znErbiiqEVWMkKtEfsyhXEwGEy_x2PqDzff4PXg@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <6bf9e8b6-55bf-f480-c316-d69fe6018ca0@huawei.com>
Date: Mon, 1 Mar 2021 22:43:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCU+HWA2znErbiiqEVWMkKtEfsyhXEwGEy_x2PqDzff4PXg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_094347_280342_540C44D7 
X-CRM114-Status: GOOD (  14.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

KyBQYWxtZXIsIHNvcnJ5IGZvcmdldCBhZGQgdG8gY2MgbGlzdC4uLgoKT24gMjAyMS8yLzI1IDEw
OjAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBPbiBXZWQsIEZlYiAyNCwgMjAyMSBhdCA1OjI5IFBN
IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Cj4+IE9u
IDIwMjEvMi8yNSA3OjM1LCBBdGlzaCBQYXRyYSB3cm90ZToKPj4+IE9uIFdlZCwgRmViIDI0LCAy
MDIxIGF0IDM6MTQgQU0gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3
cm90ZToKPj4+PiBIaSBBdGlzaCBhbmQgQXJkLAo+Pj4+Cj4+Pj4gVGhlIGNvbW1pdCAiY2I3ZDJk
ZDU2MTJhIFJJU0MtVjogQWRkIFBFL0NPRkYgaGVhZGVyIGZvciBFRkkgc3R1YiIgdXNlCj4+Pj4g
Yy5saSB0bwo+Pj4+Cj4+Pj4gYWRkIE1hZ2ljICJNWiIgc2lnbmF0dXJlIGZvciBQRS9DT0ZGIGhl
YWRlciwgd2hpY2ggc2VsZWN0IFJJU0NWX0lTQV9DLAo+Pj4+IGJ1dCAiQyIKPj4+Pgo+Pj4+IHRv
IHRoZSBJU0EgaXMgb3B0aW9uYWwsICBhbmQgaWYgIkMiIGlzIG5vdCBzdXBwb3J0ICwgIEVGSSBi
b290IGlzIG5vdAo+Pj4+IHN1cHBvcnRlZC4KPj4+Pgo+Pj4+IENvdWxkIHdlIHVzZSAiLndvcmQg
TVpfTUFHSUMiIGxpa2UgeDg2IGNvZGUgb3Igc29tZSBvdGhlciB3YXkgdG8gc3VwcG9ydAo+Pj4+
ICJNWiIgc2lnbmF0dXJlPwo+Pj4+Cj4+PiAud29yZCB3b24ndCB3b3JrIGJ1dCAuc2hvcnQgd2ls
bC4gV2l0aCAud29yZCwgeW91IGVuZCB1cCAwMDAwIGluIHRoZSAyCj4+PiBieXRlcyB3aGljaCBj
YW4gYmUgaW50ZXJwcmV0ZWQgYXMgaWxsZWdhbCBpbnN0cnVjdGlvbi4KPj4gWWVzLCBzaG91bGQg
dXNlICIuc2hvcnQiIGluIFJWLgo+Pj4gSSBndWVzcyB5b3VyIGxhcmdlciBvYmplY3RpdmUgaXMg
dG8gbWFrZSB0aGUgQyBleHRlbnNpb24gb3B0aW9uYWwgYW5kCj4+PiBub3QgZW5hYmxlZCBieSBk
ZWZhdWx0IGZvciB0aGUgTGludXgga2VybmVsLgo+PiAiQyIgZXh0ZW5zaW9uIGlzIG9wdGlvbmFs
LCBhbmQgdGhlIHVwc3RyZWFtIGtlcm5lbCBoYXMgdGhlIFJJU0NWX0lTQV9DIHdoaWNoCj4+Cj4+
IGNvdWxkIGJlIGNvbmZpZ3VyYWJsZS4gIGFuZCBJIHRoaW5rIHRoZSBFRklfU1RVQiBzaG91bGQg
bm90IGRlcGVuZCBvcgo+PiBzZWxlY3QgaXQsCj4+Cj4+IGFuZCBtYXliZSB3ZSBvbmx5IHdhbnQg
dG8gc3VwcG9ydCBSVjY0RyBpbiBzb21lIGNhc2VzLCAgd2hhdCdzIHlvdXIgb3B0aW9uPwo+Pgo+
IEkgdGhpbmsgUklTQ1ZfSVNBX0Mgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCBqdXN0IHRvIGdlbmVy
YXRlIGEgc21hbGxlcgo+IGJpbmFyeSBzaXplLgo+IEBwYWxtZXIgOiB3YXMgdGhlcmUgYW55IG90
aGVyIHJlYXNvbiA/CgpBbnkgY29tbWVudCBhYm91dCB0aGUgdG9vIGlzc3VlLAoKMSnCoCBkaXJl
Y3RseSB1c2UgLnNob3V0IE1aX01BR0lDIHRvIGRlY291cGxlIEVGSV9TVFVCIGFuZCBSSVNDVl9J
U0FfQy4KCjIpwqAgZG9uJ3Qgc2V0IFJJU0NWX0lTQV9DwqAgdG8gZGVmYXVsdCB5Cgo+Pj4gRG8g
eW91IGp1c3Qgd2FudCBpdCBmb3IgYSBjdXN0b20ga2VybmVsIG9yIHRoZSB1cHN0cmVhbSBrZXJu
ZWwgPwo+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+PiBLZWZlbmcKPj4+Pgo+Pj4+Cj4+Pj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPj4+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+
Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo+Pj4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
