Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F52D3567F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 06:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Mime-Version:
	Message-Id:From:Subject:Date:Cc:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFgRI0i2r1QXsTvRcZxYUPD0ISz/le7zqc7s0Lj3YCY=; b=R4xL2ouoae5Hac
	RC3NO1igB4nbWc9DBECv9z7ohFZiVzAnazTEWKkIh6QxdhqIsOl/vQ6cJ6VbLMBNRiybyicgYNYBh
	9w66U1W26o+LaIzPe+abJRpqOnuD9h6JOQvIVFtt7pgB3TkEIOfcYw7V2n/KvMOrkp1zjZLBu/Fp6
	DCfSxX4r8n80+SjUf+i1Ik5N4W5PiN5dQO3tkq2MZ0SNM6kwVobv+7lLg0QPFTWQrdvJGQVg6juOU
	lNYbbiH6Gf/0NNoSGAGsEs9PC0ozKc4n+6F6KYysq3NoyP01o+7KuZuxhA1a1LglDXdiYzadYr6Yz
	2naqGvqC/JQr/otEs8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkywP-0000000FX7l-3g3X;
	Wed, 28 Jan 2026 06:22:13 +0000
Received: from sg-1-33.ptr.blmpb.com ([118.26.132.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkywL-0000000FX7J-3YHb
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 06:22:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1769581318;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=jYmPdjQkc7jphb0+v4Xl7jw9RPWZnpasphOMWgbn5HI=;
 b=IPZikjvaWPzjeLundil6dOH0pQm7H84OUGoOrGfm89LOD2rzeU+DKrtgTAAlMY4/4CdqaO
 QXFU0HitpzxVCbTA9oW7lyKQuSb1MMBZ3YNFw63g18cIIBedNtfAV9FDmQQDBQfqBuN2LH
 x5OSrbak2j4MTq128R+YqrrvrV/avYRkOtPgHmbweQIzkzF8LEjlEDn7WGuqFLEHaMK2MK
 XgJ+hlGEyQYT4u6C20Gro/OpoXLVnxlybVhU+NaXcr2t1NPsPplUlGFnO0G2pxWF4pywor
 fz70L60bxEaQVfY/xdcVtZX2z8f/+JqJ84AMkQsWJr7H3br1HcNl73vVq3Rivw==
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: <yang.yicong@picoheart.com>, <lenb@kernel.org>, <tglx@kernel.org>, 
	<gregkh@linuxfoundation.org>, <dakr@kernel.org>, 
	<akpm@linux-foundation.org>, <apatel@ventanamicro.com>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<geshijian@picoheart.com>, <weidong.wd@picoheart.com>, 
	<linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Date: Wed, 28 Jan 2026 14:21:52 +0800
Received: from [100.86.224.191] ([120.234.91.239]) by smtp.feishu.cn with ESMTPS; Wed, 28 Jan 2026 14:21:55 +0800
Subject: Re: [PATCH v2] ACPI: scan: Use async schedule function for acpi_scan_clear_dep_fn
Content-Language: en-US
From: "Yicong Yang" <yang.yicong@picoheart.com>
Message-Id: <95a76a02-d9b3-494c-86fc-bb7517117d80@picoheart.com>
Mime-Version: 1.0
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
References: <20260126070427.64574-1-yang.yicong@picoheart.com> <CAJZ5v0igWB+c1ER15_0FSEBXfAaAUBXRwx3K_rt-POdsAYui8Q@mail.gmail.com>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26979ab04+a4d80d+lists.infradead.org+yang.yicong@picoheart.com>
In-Reply-To: <CAJZ5v0igWB+c1ER15_0FSEBXfAaAUBXRwx3K_rt-POdsAYui8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_222210_662308_5AFBD2DB 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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

T24gMS8yOC8yNiA0OjU2IEFNLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiBPbiBNb24sIEph
biAyNiwgMjAyNiBhdCA4OjA04oCvQU0gWWljb25nIFlhbmcgPHlhbmcueWljb25nQHBpY29oZWFy
dC5jb20+IHdyb3RlOgo+PgoKWy4uLl0KCj4+ICBzdGF0aWMgYm9vbCBhY3BpX3NjYW5fY2xlYXJf
ZGVwX3F1ZXVlKHN0cnVjdCBhY3BpX2RldmljZSAqYWRldikKPj4gIHsKPj4gLSAgICAgICBzdHJ1
Y3QgYWNwaV9zY2FuX2NsZWFyX2RlcF93b3JrICpjZHc7Cj4+IC0KPj4gICAgICAgICBpZiAoYWRl
di0+ZGVwX3VubWV0KQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pgo+PiAtICAg
ICAgIGNkdyA9IGttYWxsb2Moc2l6ZW9mKCpjZHcpLCBHRlBfS0VSTkVMKTsKPj4gLSAgICAgICBp
ZiAoIWNkdykKPj4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPj4gLQo+PiAtICAgICAg
IGNkdy0+YWRldiA9IGFkZXY7Cj4+IC0gICAgICAgSU5JVF9XT1JLKCZjZHctPndvcmssIGFjcGlf
c2Nhbl9jbGVhcl9kZXBfZm4pOwo+PiAgICAgICAgIC8qCj4+IC0gICAgICAgICogU2luY2UgdGhl
IHdvcmsgZnVuY3Rpb24gbWF5IGJsb2NrIG9uIHRoZSBsb2NrIHVudGlsIHRoZSBlbnRpcmUKPj4g
LSAgICAgICAgKiBpbml0aWFsIGVudW1lcmF0aW9uIG9mIGRldmljZXMgaXMgY29tcGxldGUsIHB1
dCBpdCBpbnRvIHRoZSB1bmJvdW5kCj4+IC0gICAgICAgICogd29ya3F1ZXVlLgo+PiArICAgICAg
ICAqIEFzeW5jIHNjaGVkdWxlIHRoZSBkZWZlcnJlZCBhY3BpX3NjYW5fY2xlYXJfZGVwX2ZuKCkg
c2luY2U6Cj4+ICsgICAgICAgICogLSBhY3BpX2J1c19hdHRhY2goKSBuZWVkcyB0byBob2xkIGFj
cGlfc2Nhbl9sb2NrIHdoaWNoIGNhbm5vdAo+PiArICAgICAgICAqICAgYmUgYWNxdWlyZWQgdW5k
ZXIgYWNwaV9kZXBfbGlzdF9sb2NrIChoZWxkIGhlcmUpCj4+ICsgICAgICAgICogLSB0aGUgZGVm
ZXJyZWQgd29yayBhdCBib290IHN0YWdlIGlzIGVuc3VyZWQgdG8gYmUgZmluaXNoZWQKPj4gKyAg
ICAgICAgKiAgIGJlZm9yZSB1c2Vyc3BhY2UgaW5pdCB0YXNrIGJ5IHRoZSBhc3luY19zeW5jaHJv
bml6ZV9mdWxsKCkKPj4gKyAgICAgICAgKiAgIGJhcnJpZXIKPj4gKyAgICAgICAgKgo+PiArICAg
ICAgICAqIFVzZSBfbm9jYWxsIHZhcmlhbnQgc2luY2UgaXQnbGwgcmV0dXJuIG9uIGZhaWx1cmUg
aW5zdGVhZCBvZgo+PiArICAgICAgICAqIHJ1biB0aGUgZnVuY3Rpb24gc3luY2hyb25vdXNseS4K
Pj4gICAgICAgICAgKi8KPj4gLSAgICAgICBxdWV1ZV93b3JrKHN5c3RlbV9kZmxfd3EsICZjZHct
PndvcmspOwo+PiArICAgICAgIGlmICghYXN5bmNfc2NoZWR1bGVfZGV2X25vY2FsbChhY3BpX3Nj
YW5fY2xlYXJfZGVwX2ZuLCAmYWRldi0+ZGV2KSkKPj4gKyAgICAgICAgICAgICAgIHJldHVybiBm
YWxzZTsKPj4KPj4gICAgICAgICByZXR1cm4gdHJ1ZTsKPiAKPiBXaGF0IGFib3V0IGRvaW5nCj4g
Cj4gICAgIHJldHVybiAhIWFzeW5jX3NjaGVkdWxlX2Rldl9ub2NhbGwoYWNwaV9zY2FuX2NsZWFy
X2RlcF9mbiwgJmFkZXYtPmRldik7Cj4gCj4gaGVyZT8KPiAKCnN1cmUsIHdpbGwgdXBkYXRlLiB0
aGUgJyEhJyBjb252ZXJzaW9uIGNvdWxkIGJlIGRyb3BwZWQgYXMKYXN5bmNfc2NoZWR1bGVfZGV2
X25vY2FsbCBhbHNvIHJldHVybnMgYm9vbGVhbi4KCnRoYW5rcy4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
