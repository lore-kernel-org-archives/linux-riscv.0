Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670F8C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 08:50:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6541610C7
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 08:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6541610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:CC:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tSpzkxj6LKLNW3oaEAa+DMGS0jw6WQSkIU9dty8BbTc=; b=JFjlXbm1V4JNuW7s/r5fqO3fb
	4MoyRN+6qwyL6F66mMBM1Wy9Db4CxUFvRqdVhcnbxcvsk24J2+Uef17BzzK18m2lPE4XZZq8l9wb5
	lzB+Bkl/NDbEZ+ce2yFQX0Hng0bQZsI5vvsjmLzAZewOs37k03GLIoKaos6JVdhYI9lRjahawvObU
	1QYIMpj+Nlt3p/Eq0RDbw7mzF3pFIEml8/3xv91/SCJ6T68SOhMm1SNOkwMY2CZJFWucbNIjNM4SY
	Cc9wUT8iPrNt7ZE0fQH1Y2794aA0Yp9yw+lzt3fh3K1PmjGjpAMWqOODgP7wEIq5dSRIqblb9XLQx
	hPm8T0a8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRt1p-008zEC-TS; Thu, 01 Apr 2021 08:50:13 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRt1k-008zD2-RH
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 08:50:11 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9xdv3jXCzyNpb;
 Thu,  1 Apr 2021 16:47:47 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Thu, 1 Apr 2021 16:49:47 +0800
Subject: Re: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
References: <20210330021624.2b776386@xhacker>
 <20210330183316.942215efe8e6e8455ad14113@kernel.org>
 <20210331222244.45a5807c@xhacker>
From: "liaochang (A)" <liaochang1@huawei.com>
CC: Masami Hiramatsu <mhiramat@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@linux.alibaba.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Message-ID: <096752a7-21f9-8339-2e76-8c65859fa1d7@huawei.com>
Date: Thu, 1 Apr 2021 16:49:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210331222244.45a5807c@xhacker>
X-Originating-IP: [10.67.110.108]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_095009_203237_16AE5046 
X-CRM114-Status: GOOD (  11.03  )
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
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSmlzaGVuZywKCtTaIDIwMjEvMy8zMSAyMjoyMiwgSmlzaGVuZyBaaGFuZyDQtLXAOgo+IE9u
IFR1ZSwgMzAgTWFyIDIwMjEgMTg6MzM6MTYgKzA5MDAKPiBNYXNhbWkgSGlyYW1hdHN1IDxtaGly
YW1hdEBrZXJuZWwub3JnPiB3cm90ZToKPiAKPj4gSGkgSmlzaGVuZywKPiAKPiBIaSBNYXNhbWks
Cj4gCj4+Cj4+IE9uIFR1ZSwgMzAgTWFyIDIwMjEgMDI6MTY6MjQgKzA4MDAKPj4gSmlzaGVuZyBa
aGFuZyA8anN6aGFuZzNAbWFpbC51c3RjLmVkdS5jbj4gd3JvdGU6Cj4+Cj4+PiBGcm9tOiBKaXNo
ZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4+Pgo+Pj4gQ3VycmVudCByaXNjdidzIGtw
cm9iZSBoYW5kbGVycyBhcmUgcnVuIHdpdGggYm90aCBwcmVlbXB0aW9uIGFuZAo+Pj4gaW50ZXJy
dXB0IGVuYWJsZWQsIHRoaXMgdmlvbGF0ZXMga3Byb2JlIHJlcXVpcmVtZW50cy4gRml4IHRoaXMg
aXNzdWUKPj4+IGJ5IGtlZXBpbmcgaW50ZXJydXB0cyBkaXNhYmxlZCBmb3IgQlJFQUtQT0lOVCBl
eGNlcHRpb24uICAKPj4KPj4gTm90IG9ubHkgd2hpbGUgdGhlIGJyZWFrcG9pbnQgZXhjZXB0aW9u
IGJ1dCBhbHNvIHVudGlsIHRoZSBlbmQgb2YKPj4gdGhlIHNpbmdsZSBzdGVwIChtYXliZSB5b3Ug
YXJlIHVzaW5nIF9fQlVHX0lOU05fMzIgPz8pIG5lZWQgdG8gYmUKPj4gZGlzYWJsZSBpbnRlcnJ1
cHRzLiBDYW4gdGhpcyBkbyB0aGF0Pwo+Pgo+IAo+IGludGVycnVwdCBpcyBkaXNhYmxlZCBkdXJp
bmcgInNpbmdsZSBzdGVwIiBieSBrcHJvYmVzX3NhdmVfbG9jYWxfaXJxZmxhZygpCj4gYW5kIGtw
cm9iZXNfcmVzdG9yZV9sb2NhbF9pcnFmbGFnKCkuIFRoZSBjb2RlIGZsb3cgbG9va3MgbGlrZTog
Cj4gCj4gZG9fdHJhcF9icmVhaygpICAgLy8gZm9yIGJwCj4gICBrcHJvYmVfYnJlYWtwb2ludF9o
YW5kbGVyKCkKPiAgICAgc2V0dXBfc2luZ2xlc3RlcCgpCj4gICAgICAga3Byb2Jlc19yZXN0b3Jl
X2xvY2FsX2lycWZsYWcoKQo+IAo+IGRvX3RyYXBfYnJlYWsoKSAgLy8gZm9yIHNzCj4gICBrcHJv
YmVfc2luZ2xlX3N0ZXBfaGFuZGxlcigpCj4gICAgIGtwcm9iZXNfcmVzdG9yZV9sb2NhbF9pcnFm
bGFnKCkKClJlY2VudGx5LCBrZXJuZWwgaGl0IEJVR19PTigpIG9uIFFFTVUgYWZ0ZXIgSSBpbnN0
YWxsIGEgcHJvYmUgYXQgInN5c19yZWFkIiB2aWEga3Byb2JlLAphY2NvcmlkaW5nIHRvIG15IGRl
YnVnZ2luZyBhbmQgYW5hbHlzaXMgaXQgbG9va3MgbGlrZSBjYXVzZWQgYnkgdGhlICJpcnEgZGlz
YWJsZSIgb3BlcmF0aW9uIGZvciBzaW5nbGUtc3RlcHBpbmcuCgpJIHByZXNlbnQgYSBkZXRhaWxl
ZCBkZXNjcmlwdGlvbiBhYm91dCB0aGlzIHByb2JsZW0gaW4gdGhlIG1haWwgd2l0aCB0aXRsZSAi
W1BBVENIXSByaXNjdi9rcHJvYmU6IGZpeCBrZXJuZWwgcGFuaWMgd2hlbiBpbnZva2luZyBzeXNf
cmVhZCB0cmFjZWQgYnkga3Byb2JlIi4KTG9va2luZyBmb3J3YXJkIHRvIHNvbWUgZmVlZGJhY2ss
VGhhbmtzLgoKQlIsCkxpYW8gQ2hhbmcKPiAKPiBUaGFua3MKPiAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gLgo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
