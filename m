Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3C2C636D4
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 02:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrsbFsct6MQOFzvjnG6F5cLNvF6R4pvOhPRyBnELWFQ=; b=Gg27kr9ALFYWVz2Q4ygPUeJ766
	td+WVYSHYDzlVTjqq8YmPUJ4S5Nr7BgEIDfF3e9sqz9rFTJKRAQIhACRMNiO7x+7fO9WhLmxnLH34
	YzFkGYpWBiOfGDSUM59I/ldlzh4vX+iWmXuWjmvZj5l6wZ0yjR6ivAzSlMmUpuqKNF7wPdP4oSS0l
	+Yy2bg1sbRxTZGvIrZvbYYFVYknNYJdladEDd8HM9tzlnA+AR48H2vJvMKC8RTQE3xsD5Zcvq5M+i
	CRtyCaWC1hNTafLhGsOJZs9asst6KYzpDdeX1MH7MA6PW1gT9dFqn7ISe3ngCK3KMzMks3t/kA3SB
	OZES6Zsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMgnx-0067VY-5P; Tue, 31 Jan 2023 02:55:29 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMgnt-0067Um-OD
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 02:55:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id m2so8695062plg.4
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 18:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vj6mBMzk1d7uFNyPaGxFlLal+ZLcp4ObFIbVZwyVdts=;
        b=c10AGnuxU4RL9IxtfFUwBrTVTiJph3zrj4fXpZJ+Zu5Tb0CS3eNXW76Vnbyrnf0CBP
         vYY6+hSh33fgNUM1a2O0dBYOppWJVAiIvjluZBat4cSfgSXOojd95QGqEILRsplYhpRH
         bUM5z2ORHLMlPMzV1K+hoP4wkPr5E7rOkNqOOkmnGRjh7UMaMKp9kHKnlloXFeBhBKBc
         JEOrFqMogrS2FiGasIEP6aLyc0yciJhSm/c5IxhDA6ez/AwFOiNnom4OMHduD8vqedSl
         THaGruHsWr/M11bK0EH2NXrCKHD705z7mn4gtfQnh/10jxwtzAXN/OMkI5jRKN1gDBvr
         B6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vj6mBMzk1d7uFNyPaGxFlLal+ZLcp4ObFIbVZwyVdts=;
        b=iXJg3zBghNFaeOk+HxaqPF8KbMdjSgOvs3v4N5oaUafsrioa1gMLWLx43Ks9Hkou0g
         iAzHJSq8ZL6SUKLw6igmr8JCSK897qsCGPST3eeaWNSjPa/lvP/fwJA3nAROoW/zVMSw
         TSZRE3VO069FBaltWtmtSTm5PQHxn+3HlbIIsaPI7E9ezVwUbjXlooK70CrwN7/NDAvy
         cpiWgxNhaYpW3iL3OYzXQrZu2T3tS22wiMLCOMJYmOPgwDltqGo51YprjyV9H2OojCt4
         1Vwyxc/CQ/qVMzyj6Qx2AUZWEo4jIoa6CkYHHjdZivgs7tPohs+E7OVj8cR7na05zaM6
         aH4g==
X-Gm-Message-State: AFqh2krvxyFkOv7wdpW779uE0fHYS8zizyvyll9OGyRdBnBtVwlLa5LN
	V7TjIkgfJ65zO3YvJAMs64ki/Q==
X-Google-Smtp-Source: AMrXdXv96l/xdFLQ6INRtgspaPh3hBc/9mcpvHcDtAc10wMKebvj1EOqzLsynmdrvhXZsWZzggxBuA==
X-Received: by 2002:a17:902:7881:b0:192:bb38:c412 with SMTP id q1-20020a170902788100b00192bb38c412mr47612855pll.44.1675133724677;
        Mon, 30 Jan 2023 18:55:24 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902694500b001967580f60fsm3918169plt.260.2023.01.30.18.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 18:55:24 -0800 (PST)
Message-ID: <eb3a3efd-89f7-db94-f99a-daa51065706c@rivosinc.com>
Date: Mon, 30 Jan 2023 18:55:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH -next v13 09/19] riscv: Add task switch support for vector
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-10-andy.chiu@sifive.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <20230125142056.18356-10-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_185525_989905_17A04409 
X-CRM114-Status: GOOD (  17.44  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Nick Knight <nick.knight@sifive.com>, Xianting Tian <xianting.tian@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Vincent Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Ruinland Tsai <ruinland.tsai@sifive.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Dmitry Vyukov <dvyukov@google.com>, "Eric W. Biederman" <ebiederm@xmission.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQW5keSwKCkZvciBzb21lIHJlYXNvbiBJIHdhcyBsb29raW5nIGNsb3NlbHkgYXQgdGhpcyBw
YXRjaCB0b2RheS4KCk9uIDEvMjUvMjMgMDY6MjAsIEFuZHkgQ2hpdSB3cm90ZToKPiAgIC8qIFdo
aXRlbGlzdCB0aGUgZnN0YXRlIGZyb20gdGhlIHRhc2tfc3RydWN0IGZvciBoYXJkZW5lZCB1c2Vy
Y29weSAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90by5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaAo+IGluZGV4IGRmMWFhNTg5Yjdm
ZC4uNjllMjQxNDAxOTVkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dp
dGNoX3RvLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90by5oCj4gQEAg
LTgsNiArOCw3IEBACj4gICAKPiAgICNpbmNsdWRlIDxsaW51eC9qdW1wX2xhYmVsLmg+Cj4gICAj
aW5jbHVkZSA8bGludXgvc2NoZWQvdGFza19zdGFjay5oPgo+ICsjaW5jbHVkZSA8YXNtL3ZlY3Rv
ci5oPgo+ICAgI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+ICAgI2luY2x1ZGUgPGFzbS9wcm9jZXNz
b3IuaD4KPiAgICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Cj4gQEAgLTY4LDYgKzY5LDIxIEBAIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfZnB1KHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9
Cj4gICAjZGVmaW5lIF9fc3dpdGNoX3RvX2ZwdShfX3ByZXYsIF9fbmV4dCkgZG8geyB9IHdoaWxl
ICgwKQo+ICAgI2VuZGlmCj4gICAKPiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgX19zd2l0Y2hfdG9fdmVjdG9yKHN0cnVjdCB0YXNrX3N0cnVjdCAqcHJl
diwKPiArCQkJCSAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqbmV4dCkKPiArewo+ICsJc3RydWN0
IHB0X3JlZ3MgKnJlZ3M7Cj4gKwo+ICsJcmVncyA9IHRhc2tfcHRfcmVncyhwcmV2KTsKPiArCWlm
ICh1bmxpa2VseShyZWdzLT5zdGF0dXMgJiBTUl9TRCkpCgpEbyB3ZSByZWFsbHkgbmVlZCB0byBj
aGVjayBTUl9TRCwgaXNuJ3QgY2hlY2tpbmcgZm9ywqAgU1JfVlNfRElSVFkgZW5vdWdoLgpJZiB5
ZXMsIHdlIGNhbiByZW1vdmUgdGhlIGNoZWNrIGhlcmUgYW5kIGtlZXAgdGhlIGV4aXN0aW5nIG9u
ZSBvbiAKdnN0YXRlX3NhdmUoKQoKPiArCQl2c3RhdGVfc2F2ZShwcmV2LCByZWdzKTsKPiArCXZz
dGF0ZV9yZXN0b3JlKG5leHQsIHRhc2tfcHRfcmVncyhuZXh0KSk7Cj4gK30KPiArI2Vsc2UgLyog
ISBDT05GSUdfUklTQ1ZfSVNBX1YgICovCj4gKyNkZWZpbmUgX19zd2l0Y2hfdG9fdmVjdG9yKF9f
cHJldiwgX19uZXh0KSBkbyB7IH0gd2hpbGUgKDApCj4gKyNlbmRpZiAvKiBDT05GSUdfUklTQ1Zf
SVNBX1YgICovCj4gKwoKQ2FuIHdlIGRlLWx1dHRlciBzd2l0Y2hfdG8uaCBzb21lIG1vcmUgYW5k
IG1vdmUgYm90aCB0aGUgZGVmaW5pdGlvbnMgb2YgCl9fc3dpdGNoX3RvX3ZlY3RvciBpbnRvIHZl
Y3Rvci5oID8KCgo+ICAgZXh0ZXJuIHN0cnVjdCB0YXNrX3N0cnVjdCAqX19zd2l0Y2hfdG8oc3Ry
dWN0IHRhc2tfc3RydWN0ICosCj4gICAJCQkJICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqKTsK
PiAgIAo+IEBAIC03Nyw2ICs5Myw4IEBAIGRvIHsJCQkJCQkJXAo+ICAgCXN0cnVjdCB0YXNrX3N0
cnVjdCAqX19uZXh0ID0gKG5leHQpOwkJXAo+ICAgCWlmIChoYXNfZnB1KCkpCQkJCQlcCj4gICAJ
CV9fc3dpdGNoX3RvX2ZwdShfX3ByZXYsIF9fbmV4dCk7CVwKPiArCWlmIChoYXNfdmVjdG9yKCkp
CQkJCQlcCj4gKwkJX19zd2l0Y2hfdG9fdmVjdG9yKF9fcHJldiwgX19uZXh0KTsJXAo+ICAgCSgo
bGFzdCkgPSBfX3N3aXRjaF90byhfX3ByZXYsIF9fbmV4dCkpOwkJXAo+ICAgfSB3aGlsZSAoMCkK
PiAgIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
