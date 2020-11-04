Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9329FC2D0A3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 03:16:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EDE32067C
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 03:16:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v9wDJLph"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EDE32067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b2rljNynNDVOk4KHn92mcGAdcnMfT8L6sPfZ3Jeht9A=; b=v9wDJLph4y/K1O+Ow/UQmqHfh
	tY2LWKodtpAfWYI7gpRNwbL9KHdlZ/TliNYo/C6Iql1DfQdB30WoZ0DG5JhpreQQfPdXGQSl+pW0u
	PEVBnveELYg1xmuwYvzyUfFZ31FABWb1feYHj5FEA2qOwRTz8J+vat50JovAn1cBTiCwx+SELazdZ
	cQjX6tnAPUG9aE3fokVjRlIpw17IwWqmlozwZDsX6BNei5pzuo7FjBRoUquPEkHfNxTgdyYXusqDz
	8aHebMaP5JJ2rzFWeoH9lU+hPUD/QR3sp4KL0q+oBot6U1IDGAJarsZWur3uzEw4A+WXXFzu6Kwsx
	UZ6oQ44pQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka9Hd-0000gq-UG; Wed, 04 Nov 2020 03:16:26 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka9Ha-0000el-Ec
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 03:16:23 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CQsHT702Sz15QnY;
 Wed,  4 Nov 2020 11:16:05 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Wed, 4 Nov 2020 11:16:05 +0800
Subject: Re: [PATCH 2/3] riscv: cleaning up boot dir
To: Atish Patra <atishp@atishpatra.org>
References: <20201102040357.118400-1-wangkefeng.wang@huawei.com>
 <20201102040357.118400-2-wangkefeng.wang@huawei.com>
 <CAOnJCUJAOtdyhxWxThVuQD920VbfE-tpYyiE3+yhbhEO-0V6gQ@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <0a24b95a-7cd1-43ad-433d-65ed36ae3611@huawei.com>
Date: Wed, 4 Nov 2020 11:16:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCUJAOtdyhxWxThVuQD920VbfE-tpYyiE3+yhbhEO-0V6gQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_221622_824173_8F71577D 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvMTEvMyAyMzo1MywgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gT24gU3VuLCBOb3YgMSwg
MjAyMCBhdCA3OjU4IFBNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4g
d3JvdGU6Cj4+IExldCdzIHJlbW92ZSBhbGwgZmlsZXMgdW5kZXIgcmlzY3YgYm9vdCBkaXIgYnkg
dXNpbmcgYXJjaGNsZWFuIHJ1bGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3
YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9NYWtlZmls
ZSAgICAgIHwgMyArKysKPj4gICBhcmNoL3Jpc2N2L2Jvb3QvTWFrZWZpbGUgfCAzICsrLQo+PiAg
IDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L01ha2VmaWxlIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+PiBp
bmRleCAwZDllY2I5NTk5NjIuLjhjMjllNTUzZWY3ZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNj
di9NYWtlZmlsZQo+PiArKysgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4+IEBAIC0xMDEsMyArMTAx
LDYgQEAgSW1hZ2UuJTogSW1hZ2UKPj4KPj4gICB6aW5zdGFsbCBpbnN0YWxsOgo+PiAgICAgICAg
ICAkKFEpJChNQUtFKSAkKGJ1aWxkKT0kKGJvb3QpICRACj4+ICsKPj4gK2FyY2hjbGVhbjoKPj4g
KyAgICAgICAkKFEpJChNQUtFKSAkKGNsZWFuKT0kKGJvb3QpCj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2Jvb3QvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2Jvb3QvTWFrZWZpbGUKPj4gaW5kZXgg
YzU5ZmNhNjk1ZjlkLi42NjZmMDg2NjIxNzAgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9v
dC9NYWtlZmlsZQo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvTWFrZWZpbGUKPj4gQEAgLTE4LDcg
KzE4LDggQEAgS0NPVl9JTlNUUlVNRU5UIDo9IG4KPj4KPj4gICBPQkpDT1BZRkxBR1NfSW1hZ2Ug
Oj0tTyBiaW5hcnkgLVIgLm5vdGUgLVIgLm5vdGUuZ251LmJ1aWxkLWlkIC1SIC5jb21tZW50IC1T
Cj4+Cj4+IC10YXJnZXRzIDo9IEltYWdlIGxvYWRlcgo+PiArdGFyZ2V0cyA6PSBJbWFnZSBJbWFn
ZS5iejIgSW1hZ2UuZ3ogSW1hZ2UubHo0IEltYWdlLmx6bWEgSW1hZ2UubHpvIFwKPj4gKyAgICAg
ICAgICBsb2FkZXIgbG9hZGVyLm8gbG9hZGVyLmxkcyBsb2FkZXIuYmluCj4+Cj4gSW1hZ2UuKiBz
aG91bGQgYmUgc3VmZmljaWVudCB0byBjbGVhbiBhbGwgY29tcHJlc3NlZCBpbWFnZXMuCgpXaWxs
IGNoYW5nZSBhbmQgcmVzZW5k77yMIHRoYW5rcy4KCj4KPj4gICAkKG9iaikvSW1hZ2U6IHZtbGlu
dXggRk9SQ0UKPj4gICAgICAgICAgJChjYWxsIGlmX2NoYW5nZWQsb2JqY29weSkKPj4gLS0KPj4g
Mi4yNi4yCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKPiBPdGhlcndpc2UsCj4KPiBSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEg
PGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
