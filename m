Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568D8F46C44
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8+/g09yG0eofFUK3SV9Yf1tn+AfV7xi8kQDMZt6eSQ=; b=uDOJ9U/T9xGMhv
	xPXWObazsYKPBksMJVwve4PgS4sv31H+ZMAmgD7bZ7x9ExiPdmQT82NpAR88d/cXJYYDUsQkIPQiL
	7n8X1FfbFhPk0yVAfts3vmMj+bTaySIqWXHkYT96mPg6Htk4AX5ztHoHAL21n+Af2VhGp6elLph4x
	2COno25DFJgZK4ov5FW4AWS4OlFJJBwFMn0lxTVAJltGMdTLFqRkKMRaijBc0dlRx1YaRr3hZoP4C
	q4u99QR43Y1gRjLrqo9PpgnBnDUyX3CYFqWpuNsnS3RlYLGtQBXH83cXMZr3lv6YBfIbnQgUQBF6T
	dk//po1+MGtg5U+FWA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lDb-00000005Dg8-1E3r;
	Mon, 06 Apr 2026 14:46:23 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lDY-00000005Dfi-1AOr
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 14:46:22 +0000
Received: from [192.168.0.101] (unknown [123.118.218.47])
	by APP-05 (Coremail) with SMTP id zQCowAAHmQwux9Nps+a1DA--.49435S2;
	Mon, 06 Apr 2026 22:46:07 +0800 (CST)
Message-ID: <3538ad96-1dec-4bfd-9671-d351b385b4be@iscas.ac.cn>
Date: Mon, 6 Apr 2026 22:46:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Devicetree spec: Specifying /cpus/cpu@* unit address format?
To: Rob Herring <robh@kernel.org>, David Gibson <david@gibson.dropbear.id.au>
Cc: devicetree-spec@vger.kernel.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
References: <00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn>
 <adHofcKAr7C5YCSA@zatzit>
 <CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAL_JsqJFv3+UJ-bjLGk0i7Wc+spsowCrqQZ_s3P4gN8r1W-Q-w@mail.gmail.com>
X-CM-TRANSID: zQCowAAHmQwux9Nps+a1DA--.49435S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr47uFWUKr13Xw45XFWUJwb_yoWkCrX_Wa
	yj9r4DAr1DZay3Kasayr4rZasF9rWrCrZ8X3yUJwsrWa4kXFyDWFn3Gr1kZFn3Aw4jvw1a
	kr98ZF47C3yxWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU8fpnPUUUUU==
X-Originating-IP: [123.118.218.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_074620_733427_E299DB80 
X-CRM114-Status: UNSURE (   8.31  )
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

T24gNC82LzI2IDIwOjQ4LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBTYXQsIEFwciA0LCAyMDI2
IGF0IDExOjQz4oCvUE0gRGF2aWQgR2lic29uCj4gPGRhdmlkQGdpYnNvbi5kcm9wYmVhci5pZC5h
dT4gd3JvdGU6Cj4+IE9uIEZyaSwgQXByIDAzLCAyMDI2IGF0IDA2OjA2OjE3UE0gKzA4MDAsIFZp
dmlhbiBXYW5nIHdyb3RlOgo+Pj4gKEFsc28gcG9zdGVkIGF0OiBodHRwczovL2dpdGh1Yi5jb20v
ZGV2aWNldHJlZS1vcmcvZGV2aWNldHJlZS1zcGVjaWZpY2F0aW9uL2lzc3Vlcy84NiApCj4+Pgo+
Pj4gSGkgYWxsLAo+Pj4KPj4+IFByZXNlbnRseSwgdGhlcmUgc2VlbXMgdG8gYmUgc29tZSBjb25m
dXNpb24gaW4gdGhlIGNvbW11bml0eSBhYm91dCB0aGUKPj4+IGZvcm1hdCBvZiB1bml0IGFkZHJl
c3NlcyBmb3IgIi9jcHVzL2NwdUAqIiBub2RlcyBmb3IgYSBDUFUgd2l0aCBJRCA+IDksIGUuZy4K
Pj4+Cj4+PiAgICAgY3B1QD8/PyB7Cj4+PiAgICAgICAgIHJlZyA9IDwxMD47Cj4+PiAgICAgICAg
IC8qIHJlZyA9IDwweGE+OyAqLyAvKiBUaGlzIHNob3VsZCBiZSBlcXVpdmFsZW50ICovCj4+PiAg
ICAgfQo+Pj4KPj4+Cj4+PiBTaG91bGQgdGhpcyBiZSBhIGRlY2ltYWwgImNwdUAxMCIsIG9yIGhl
eGFkZWNpbWFsICJjcHVAYSI/IEkgY2FuJ3QgZmluZAo+Pj4gYW55IGV4cGxpY2l0IHNwZWNpZmlj
YXRpb24uCj4+IEl0IHNob3VsZCBiZSBoZXguICBUaGF0J3MgYSBnZW5lcmFsIGNvbnZlbnRpb24g
Zm9yIHVuaXQgYWRkcmVzc2VzLgo+PiBCZWZvcmUgZmxhdHRlbmVkIHRyZWVzLCBPRiBlc3NlbnRp
YWxseSBuZXZlciB1c2VkIGRlY2ltYWwKPj4gcmVwcmVzZW50YXRpb25zIG9mIHRoaW5ncy4KPiBU
aGUgb25seSBkZWNpbWFsIHVzYWdlIGluIEZEVCB3ZXJlIG1pc3Rha2VzLgoKVGhhbmtzIGZvciB0
aGlzLiBUaGlzIGlzIGNsZWFyIGVub3VnaCBmb3IgbWUuCgo+IFJhdGhlciB0aGFuIHdvcnJ5aW5n
IGFib3V0IHdoYXQgdGhlIHNwZWMgc2F5cywgcGxlYXNlIHdvcnJ5IGFib3V0IHdoYXQKPiB0aGUg
dG9vbHMgY2hlY2suCgpTaW5jZSwgYXMgeW91IHR3byBzYWlkLCB0aGVyZSBpcyBhbiBlc3RhYmxp
c2hlZCBjb252ZW50aW9uLCBJIGFncmVlIHRoYXQKY29udmVudGlvbiBpcyBlbm91Z2ggaGVyZS4K
ClRoYW5rcywKVml2aWFuICJkcmFtZm9yZXZlciIgV2FuZwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
