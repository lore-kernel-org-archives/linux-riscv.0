Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659F9EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2e2KkpaWaoqgo8T0BlNE/HmIyf3QiORhFvz96ei35Ro=; b=HoHyUULCXD8h1F
	d2UDInaJAVAf5hDKFp5E4eXSzvQtUmKaMVEEPotAvHVcYeBMp/JW33fQBMPeD+NrJGkDlPrcIxUnu
	l9m37SC4d4zkoHQn9DSw5xKMUs1x2wx6ltFjRhRf8dZP4KRoYUlyxrJoqUZeb2aAisddn0W+M5RmQ
	BVHxbeZGwxfXtwucpdLLnJ/4SCtIFOvxlQhxDfYxaQdnDJhsYrSbV8MhCEnLYxVZDKd0fIV6XZIUf
	eEqHb13CFMFQ+8THy7FXs3lGQ3eic+eC0HiceVkbjdcF3I2AqxoGLHdPXeT4V7WV6ac9WCrMlbnsb
	BBDRJ1wPj/p90Rr/Vekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJdP-00AdrH-2u;
	Mon, 03 Jul 2023 13:30:31 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJdJ-00AdqD-2W
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 13:30:27 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3143b70d6easo459731f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688391022; x=1690983022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZnnVKMWmgBZv3yMj96JcjDuZoVh3HEOvpCHPpz/5Hw=;
        b=RhWjkWg47DeZvNYSTBWmzfRWp/NSRN7KvZP+k+WDia+g2UwEY3uMkFbc0PV4+VjKxI
         ihlj1ack+jSKLBZDbdWN2Rn8TG9dLXZKmOi7ZWLwSFfTG0si6eteY/Q2W1reSpUmiG4Y
         Be3f4CybS9YtYRzva4QvLgWuhRgQIifKVjD1MStbRBDUzKFx+/1KkHSvNjAkUJdYOjOE
         843n9xW8eodngvmbdgGDyxUO63z8v2yQmYuRcO2CDPTM2aVXyOlxXnlrs7ypp363cSdB
         txQZYnhUHB7E5T2sN+H3RLfcVqE25ongv8xBfXwTPA15FyxbfZ7FF7aAMaIjd+W8hr8M
         zl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688391022; x=1690983022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZnnVKMWmgBZv3yMj96JcjDuZoVh3HEOvpCHPpz/5Hw=;
        b=MTA2bh0WS54nXai2xKKN+8k28F+8FzsDdQuBI4bN3W7hRfdKpbiguV+gBY5l/K8hLl
         p6BUI6bQAyat5L5bxNlzmvB2EqU5nBpsDNlxMVxU+JBDSxcbzU5WK8mhpbCFSyFk88ai
         4SGP150ktri0e4J62BeCWb5M96SSfe7htRnveNqzmTVx6JgQMYI/vzrxGTfd4p/eYaJx
         3gQOZVHRO4mk3OUYniOoKEGKzK4dt8ewOWE65yyc5r6DPmOTSzxjeb3EIW7Wk+xRDJoQ
         xeFiEH15XRVJ6D7aQyIxCTY4Tt2VOopBnjErWXhju1ugn5LPF4QEP0ooP5sANiSGFZCS
         bj/g==
X-Gm-Message-State: ABy/qLZ6BPxuu0JS+cahqpHphfJmiGI0PgYsFQld5EBXQLZT/31VS+tT
	QxItHmU/14TNmXs7B+oYWQKzdFAYAqLnzHA9WTnXdw==
X-Google-Smtp-Source: APBJJlFLHnoWLC7fXKGELY0yfhUnCQIhkvaJIxen0SRkggMiciJCwTGHTehB9bng5XROJZG+5KrStqYwIAfQ6Z10yaU=
X-Received: by 2002:a5d:5410:0:b0:314:17b0:d35c with SMTP id
 g16-20020a5d5410000000b0031417b0d35cmr7098244wrv.55.1688391021887; Mon, 03
 Jul 2023 06:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230702095735.860-1-cuiyunhui@bytedance.com> <20230703-71f67eb66a037f5c0fb825c6@orel>
In-Reply-To: <20230703-71f67eb66a037f5c0fb825c6@orel>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Mon, 3 Jul 2023 21:30:10 +0800
Message-ID: <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
To: Andrew Jones <ajones@ventanamicro.com>
Cc: ardb@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, rminnich@gmail.com, 
	mark.rutland@arm.com, lpieralisi@kernel.org, rafael@kernel.org, 
	lenb@kernel.org, jdelvare@suse.com, yc.hung@mediatek.com, 
	angelogioacchino.delregno@collabora.com, allen-kh.cheng@mediatek.com, 
	pierre-louis.bossart@linux.intel.com, tinghan.shen@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	geshijian@bytedance.com, weidong.wd@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_063025_819198_4B5CD56F 
X-CRM114-Status: UNSURE (   6.96  )
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

SGkgZHJldywKCk9uIE1vbiwgSnVsIDMsIDIwMjMgYXQgOTowMeKAr1BNIEFuZHJldyBKb25lcyA8
YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4KPiAoVGhpcyBpcyBhIHJlcGx5IHRv
IGEgbm9uLWV4aXN0ZW50IGNvdmVyIGxldHRlci4pCgpUaGlzIGhhcyBiZWVuIGRpc2N1c3NlZCBt
YW55IHRpbWVzIHdpdGggQXJkLCBQbGVhc2UgcmVmZXIgdG8gOgpodHRwczovL3BhdGNoZXMubGlu
YXJvLm9yZy9wcm9qZWN0L2xpbnV4LWFjcGkvcGF0Y2gvMjAyMzA0MjYwMzQwMDEuMTYtMS1jdWl5
dW5odWlAYnl0ZWRhbmNlLmNvbS8KCgo+IEknbSBub3QgYSBiaWcgZmFuIG9mIGFkZGluZyB5ZXQg
YW5vdGhlciBpbnRlcmZhY2UuIEhhdmUgeW91IGNvbnNpZGVyZWQKPiBkb2luZyBzb21ldGhpbmcg
bGlrZSBbMV0/Cj4KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS90aWFub2NvcmUu
Z2l0aHViLmlvL3dpa2kvVWVmaVBheWxvYWRQa2cKPgo+IFRoYW5rcywKPiBkcmV3CgpUaGFua3Ms
Cll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
