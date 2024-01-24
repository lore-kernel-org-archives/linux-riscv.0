Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1263C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDbfOZBQSkDZrJa5fp17bQAJ/BXX8ExO0z9Hm1NbTCk=; b=toG4CEp1tYQu3n
	c6a1zph1SuHNxssU5rGz6nU/CMLuhdPV/ayJpz07oJRqeth2tFJSsEZggo3GkueOZJF55QkkYQjXf
	DGodoFhbJ+4xV9Qz71bK+7T4RkbreAIiR8zH+dRCSlizPqZvBKiFHUN8CsqpYJh4l+Xgy9r5YUpT+
	ySiKecPKn+vUn3h/dy/4PtkAl5Olx3gcY+xysGrkPIHJcl7np1E1STt4nFjKz6bVwG16oJN7XrzVM
	Dyvl0tAcYl72qx1yj6jz09ysenKzYVjZfP7xd2KiCZ3zzU0ramfIvHl5nNfa4owGl/+colq2TmvHb
	JsYBNyvi23EC9kbWx6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSi6w-004ibF-0X;
	Wed, 24 Jan 2024 18:36:30 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSi6t-004iYW-0b
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 18:36:29 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6daa89a6452so4131975b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 10:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706121381; x=1706726181; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dyoVaujb6HdGGQZquWAHWyK8BzIubclZKA3RVrGEVpc=;
        b=kCQhW7lEBkCiH+EpVSwKtcm3t/qnmBkKVlJeYaQicerXo6p4Zca151ezvBOJKVJidP
         G4/ko2DGcSv2HYTTVAs7Lco5vstrvBdBQIK6n9mnMMZUg4N549GTdcaRqDQBPznlhP0z
         yJE8qQ3NtVnW1DZO6IOllc0TGa3DahsH1De7B6wl2LIvZMx2G/EfkzcwpRXe2XnhqGvY
         juorDEc666AuPW7KovveprFAyNFQoLII7uD/k6/FCRBYXKXz1o4SQNvEEXgolPKpulx4
         SGpSfsB/i+9AkFlfKaYAVdO0CwCV7vBcScs/7CF1CQ6d6ZiR+Ua0frD8lANq6qKwD4Ht
         EbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706121381; x=1706726181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dyoVaujb6HdGGQZquWAHWyK8BzIubclZKA3RVrGEVpc=;
        b=TIaRQOOQFjG0VfRRc+NtJsKWQC0imNj66LnXb1JveO+riK93hmcPx8/uYNeqLP1mN4
         tStw8n7hc4833VlGBZISozT9VBYbrx1oIWLF6sUUua8jQPyqaG16hH6oGKQIs6a0NsXR
         RZOHmZOmCYJvC4LsmoduK0B+i9/iZqhhaBci44pAAjwX3X9jGt1HWh2OShuWgreo/UA3
         ybDw4FhmekdKEU1Xd48oMQjlijshB6JMCRKsLARzo5xCOCg07M8+GmHgcb0YsIX7FXqE
         Y65mWDuL1014+6vTwToy++kwvNh94HAuZcOAMXGqWqiAraXWxX4tmtdpRsRTiMLBnJU6
         yFoQ==
X-Gm-Message-State: AOJu0Yz6eHHeyqmibGdABDRNYqTAhto7AIkRYqOVcg1R96CNoF5JQ8Lo
	cugGpMDvQNQy1uTb/+2sr357n/qyyCKSVbaKZ08Q4omlOVaqnu1zo8VezsH+mY4=
X-Google-Smtp-Source: AGHT+IGa4MiJVKL68+be1ENZatYewBEzPKO9fNG4WgZ7fFnKMwOYC9yysxlwKGZJPdjj+oZ9bTHTzA==
X-Received: by 2002:a05:6a20:6e91:b0:19a:e5cd:c41d with SMTP id gr17-20020a056a206e9100b0019ae5cdc41dmr881650pzb.96.1706121381191;
        Wed, 24 Jan 2024 10:36:21 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id p12-20020a056a0026cc00b006ddc2a97806sm444955pfw.213.2024.01.24.10.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 10:36:20 -0800 (PST)
Date: Wed, 24 Jan 2024 10:36:17 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: guoren@kernel.org
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, alexghiti@rivosinc.com, xiao.w.wang@intel.com,
	david@redhat.com, panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com, willy@infradead.org, bjorn@rivosinc.com,
	conor.dooley@microchip.com, cleger@rivosinc.com, leobras@redhat.com,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V3 4/4] riscv: mm: Optimize TASK_SIZE definition
Message-ID: <ZbFYoT4OWQQs7H5z@ghost>
References: <20231222115703.2404036-1-guoren@kernel.org>
 <20231222115703.2404036-5-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222115703.2404036-5-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_103627_225529_73F93F23 
X-CRM114-Status: GOOD (  14.31  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDY6NTc6MDNBTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+IAo+
IFVuaWZ5IHRoZSBUQVNLX1NJWkUgZGVmaW5pdGlvbiB3aXRoIFZBX0JJVFMgZm9yIGJldHRlciBy
ZWFkYWJpbGl0eS4KPiBBZGQgQ09NUEFUIG1vZGUgdXNlciBhZGRyZXNzIHNwYWNlIGluZm8gaW4g
dGhlIGNvbW1lbnQuCj4gCj4gUmV2aWV3ZWQtYnk6IExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVk
aGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgNSArKystLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGd0YWJsZS5oCj4gaW5kZXggZTQxNTU4MjI3NmVjLi4yNzE1NjVlMTk1NmYgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaAo+IEBAIC04NjYsNiArODY2LDcgQEAgc3RhdGljIGlubGluZSBw
dGVfdCBwdGVfc3dwX2NsZWFyX2V4Y2x1c2l2ZShwdGVfdCBwdGUpCj4gICAqIE5vdGUgdGhhdCBQ
R0RJUl9TSVpFIG11c3QgZXZlbmx5IGRpdmlkZSBUQVNLX1NJWkUuCj4gICAqIFRhc2sgc2l6ZSBp
czoKPiAgICogLSAgICAgICAgMHg5ZmMwMDAwMAkofjIuNUdCKSBmb3IgUlYzMi4KPiArICogLSAg
ICAgICAgMHg4MDAwMDAwMAkoICAgMkdCKSBmb3IgUlY2NCBjb21wYXQgbW9kZQo+ICAgKiAtICAg
ICAgMHg0MDAwMDAwMDAwCSggMjU2R0IpIGZvciBSVjY0IHVzaW5nIFNWMzkgbW11Cj4gICAqIC0g
ICAgMHg4MDAwMDAwMDAwMDAJKCAxMjhUQikgZm9yIFJWNjQgdXNpbmcgU1Y0OCBtbXUKPiAgICog
LSAweDEwMDAwMDAwMDAwMDAwMAkoICA2NFBCKSBmb3IgUlY2NCB1c2luZyBTVjU3IG1tdQo+IEBA
IC04NzcsMTAgKzg3OCwxMCBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9zd3BfY2xlYXJfZXhj
bHVzaXZlKHB0ZV90IHB0ZSkKPiAgICogU2ltaWxhcmx5IGZvciBTVjU3LCBiaXRzIDYz4oCTNTcg
bXVzdCBiZSBlcXVhbCB0byBiaXQgNTYuCj4gICAqLwo+ICAjaWZkZWYgQ09ORklHXzY0QklUCj4g
LSNkZWZpbmUgVEFTS19TSVpFXzY0CShQR0RJUl9TSVpFICogUFRSU19QRVJfUEdEIC8gMikKPiAr
I2RlZmluZSBUQVNLX1NJWkVfNjQJKFVMKDEpIDw8IChWQV9CSVRTIC0gMSkpCj4gIAo+ICAjaWZk
ZWYgQ09ORklHX0NPTVBBVAo+IC0jZGVmaW5lIFRBU0tfU0laRV8zMgkoX0FDKDB4ODAwMDAwMDAs
IFVMKSkKPiArI2RlZmluZSBUQVNLX1NJWkVfMzIJKFVMKDEpIDw8IChWQV9CSVRTX1NWMzIgLSAx
KSkKPiAgI2RlZmluZSBUQVNLX1NJWkUJKHRlc3RfdGhyZWFkX2ZsYWcoVElGXzMyQklUKSA/IFwK
PiAgCQkJIFRBU0tfU0laRV8zMiA6IFRBU0tfU0laRV82NCkKPiAgI2Vsc2UKPiAtLSAKPiAyLjQw
LjEKPiAKClJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29t
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
