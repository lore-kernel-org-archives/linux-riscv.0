Return-Path: <SRS0=iJWH=NH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FCBC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 06:24:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5589C61A3F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 06:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5589C61A3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3gjLNM+RI0N+tvALSyCErngSDCquR/Pdpv552FUfYg8=; b=eiBRPWTVSDh/6RL3QfR7/U8mUb
	4PphRVpBSqBWBy9paYm83ASlVeDhG7rDicaJGS4fULrF4SkmH/Cxg8MeiCJfHu52jk8tEmQC6Awh4
	Vn8bznzU8Rd5Iq2ch4JzpR11lwy4jvbTnloPAviQ1iVCkhR4Z5877kSp+EbzI0DCdbCNhZhKiWjBM
	7ifm8pNizB5vi/w3FGhtZxkGTPfH6oPVQ/uW/aR3LZl+lB/sbiOHwQ1DVp/jcqMdzI61YrMWreDp3
	dSeXmGSeJtfQb5qZ4LZsJwCSU7pJIhqFY7FxcF0LprL2cjxKP2e0ZjSQDpUm5TirBj8cFnPbRr04n
	gwhyNIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFW2y-00GE8L-IX; Mon, 16 Aug 2021 06:24:32 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFW2w-00GE67-22
 for linux-riscv@lists.infradead.org; Mon, 16 Aug 2021 06:24:31 +0000
Received: by mail-pj1-x102b.google.com with SMTP id w14so24808433pjh.5
 for <linux-riscv@lists.infradead.org>; Sun, 15 Aug 2021 23:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=23pZdDZvayZfho6lEg24byBzL5clbVqj1eN+MVW+fDA=;
 b=tWu+9GYLUX7sA15K9OMss48Xysc3lLH/dxhPkn9HvOhOEzGuS23A6p6C0TZiNU+rOV
 rXAZXBmlVwY7CTW4cdkZEuqLwEhY3sMpkLBdMwhPlyF3kOr9SgX6zwWGT/pGFLZi0zAC
 Bj4T6cldi0UDd5PKFo4TSXyzlfCd989tLkWPSB+nswV6IDLGkj/h7j51GSJaqSJW4zXj
 8qWCpiSmVD905N8k7bCw0LzHRJ6ciQXd9LHRfb5uRjV8Muk36IWtuew9GYfvNMK1m6dL
 GqnBv0+MSJBn2xx10nUjDydPkFqLa4OXD63Geta4L+zcsoVfzjH8KRDTvwT/qcG9+/hL
 Sizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=23pZdDZvayZfho6lEg24byBzL5clbVqj1eN+MVW+fDA=;
 b=KXX2PLISQg58Rl3DDdRDCS8e6XugMO+k8dsxbkF9S68rnpd8pMUmqOgzjqnuoE7vwr
 gM+sb9AQFOM878W4w6G2zmugITzEAWm/Y2qlZUFUSCzTEA79hEndEP6v6Zp2+NLvl1r3
 d1OplNBf9p40V0BVPBlmsTYbZlBWffhdSMkaN6ZAam9SwODmn0UXXlwO7WsymRyiqzxT
 jn8hI+30GwbpF6hn9NOIM+1vHREqhtIBiAXw/j6eJMjiCC6laWYCa+ZpSvU5gwG6NYs+
 pla/dfjzNdUpaIbhmRscILOF86HP+df7o7npv6jKBjqCUlYpzUHIp0ipade8aiADRa8h
 Fnwg==
X-Gm-Message-State: AOAM53232D2QSI59Kg+bR+A84H0N5WOzo1+/w7UF02qQN3LX2mOCEY+J
 JdCH2mlEiBzDW63gOZxDXBk=
X-Google-Smtp-Source: ABdhPJzVAIJ31lpj7u5UPVpJBogp1VYtKi8dYeVvFvYl4YX++6DL2/CZUT9rmqfnDARCiomG0WSojQ==
X-Received: by 2002:a63:f749:: with SMTP id f9mr14654432pgk.77.1629095065068; 
 Sun, 15 Aug 2021 23:24:25 -0700 (PDT)
Received: from [10.252.0.31]
 (ec2-18-183-84-255.ap-northeast-1.compute.amazonaws.com. [18.183.84.255])
 by smtp.gmail.com with ESMTPSA id x19sm10051269pfa.104.2021.08.15.23.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 23:24:24 -0700 (PDT)
Cc: akira.tsukamoto@gmail.com
Subject: Re: [PATCH 0/1] __asm_copy_to-from_user: Reduce more byte_copy
To: Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
 <a70451d1-57ad-6b49-24c1-6408ef94a959@gmail.com>
 <61187c37.1c69fb81.ed9bd.cc45SMTPIN_ADDED_BROKEN@mx.google.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <a85be25a-3a67-2baa-531d-98fa4f292f30@gmail.com>
Date: Mon, 16 Aug 2021 15:24:20 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <61187c37.1c69fb81.ed9bd.cc45SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_232430_140219_A99D120F 
X-CRM114-Status: GOOD (  10.29  )
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

SGkgUWl1LAoKT24gOC8xNS8yMDIxIDExOjMwIEFNLCBRaXUgV2VuYm8gd3JvdGU6Cj4gSGkgQWtp
cmEsCj4gCj4gCj4gVGhpcyBwYXRjaCBicmVha3MgbXkgdXNlcnNwYWNlwqAgYW5kIEkgY2FuJ3Qg
Ym9vdCBteSBzeXN0ZW0gYWZ0ZXIgYXBwbHlpbmcgdGhpcy4gSGVyZSBpcyB0aGUgc3RhY2sgdHJh
Y2U6Cj4gCj4gCj4gW8KgwqAgMTAuMzQ5MDgwXSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxM
IHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwMDAwMDAwMDAK
PiBbwqDCoCAxMC4zNTcxMTZdIE9vcHMgWyMxNV0KPiBbwqDCoCAxMC4zNTk0MzNdIENQVTogMiBQ
SUQ6IDE2OSBDb21tOiAobmV0d29ya2QpIFRhaW50ZWQ6IEcgRMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDUuMTQuMC1yYzUgIzUzCj4gW8KgwqAgMTAuMzY3NDIyXSBIYXJkd2FyZSBuYW1lOiBTaUZpdmUg
SGlGaXZlIFVubWF0Y2hlZCBBMDAgKERUKQo+IFvCoMKgIDEwLjM3Mjk4MV0gZXBjIDogX19hc21f
Y29weV9mcm9tX3VzZXIrMHg0OC8weGYwCj4gW8KgwqAgMTAuMzc3NTg0XcKgIHJhIDogX2NvcHlf
ZnJvbV91c2VyKzB4MjgvMHg2OAo+IFvCoMKgIDEwLjM4MTc1NF0gZXBjIDogZmZmZmZmZmY4MDk5
YTI4MCByYSA6IGZmZmZmZmZmODAzNjE0YTggc3AgOiBmZmZmZmZkMDA0MTZiZDkwCj4gW8KgwqAg
MTAuMzg4OTYzXcKgIGdwIDogZmZmZmZmZmY4MTFlZTU0MCB0cCA6IGZmZmZmZmUwODQxYjM2ODAg
dDAgOiBmZmZmZmZkMDA0MTZiZGUwCj4gW8KgwqAgMTAuMzk2MTcyXcKgIHQxIDogZmZmZmZmZDAw
NDE2YmRkOCB0MiA6IDAwMDAwMDNmZjA5Y2EzYTAgczAgOiBmZmZmZmZkMDA0MTZiZGMwCj4gW8Kg
wqAgMTAuNDAzMzgxXcKgIHMxIDogMDAwMDAwMDAwMDAwMDAwMCBhMCA6IGZmZmZmZmQwMDQxNmJk
ZDggYTEgOiAwMDAwMDAwMDAwMDAwMDAwCj4gW8KgwqAgMTAuNDEwNTkwXcKgIGEyIDogMDAwMDAw
MDAwMDAwMDAxMCBhMyA6IDAwMDAwMDAwMDAwMDAwNDAgYTQgOiBmZmZmZmZkMDA0MTZiZTE4Cj4g
W8KgwqAgMTAuNDE3ODAwXcKgIGE1IDogMDAwMDAwM2ZmZmZmZmZmMCBhNiA6IDAwMDAwMDAwMDAw
MDAwMGYgYTcgOiBmZmZmZmZlMDg1ZDU4NTQwCj4gW8KgwqAgMTAuNDI1MDA5XcKgIHMyIDogMDAw
MDAwMDAwMDAwMDAxMCBzMyA6IGZmZmZmZmQwMDQxNmJkZDggczQgOiAwMDAwMDAwMDAwMDAwMDAy
Cj4gW8KgwqAgMTAuNDMyMjE4XcKgIHM1IDogMDAwMDAwMDAwMDAwMDAwMCBzNiA6IDAwMDAwMDAw
MDAwMDAwMDAgczcgOiBmZmZmZmZlMDg0MWIzNjgwCj4gW8KgwqAgMTAuNDM5NDI3XcKgIHM4IDog
MDAwMDAwMmFhZDc4ODA0MCBzOSA6IDAwMDAwMDAwMDAwMDAwMDAgczEwOiAwMDAwMDAwMDAwMDAw
MDAxCj4gW8KgwqAgMTAuNDQ2NjM2XcKgIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6IDAwMDAw
MDAwMDAwMDAwMDAgdDQgOiAwMDAwMDAwMDAwMDAwMDAxCj4gW8KgwqAgMTAuNDUzODQ1XcKgIHQ1
IDogMDAwMDAwMDAwMDAwMDAxMCB0NiA6IDAwMDAwMDAwMDAwNDAwMDAKPiBbwqDCoCAxMC40NTkx
NDRdIHN0YXR1czogMDAwMDAwMDIwMDA0MDEyMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAwIGNh
dXNlOiAwMDAwMDAwMDAwMDAwMDBkCj4gW8KgwqAgMTAuNDY3MDQ5XSBbPGZmZmZmZmZmODA5OWEy
ODA+XSBfX2FzbV9jb3B5X2Zyb21fdXNlcisweDQ4LzB4ZjAKPiBbwqDCoCAxMC40NzI5NTVdIFs8
ZmZmZmZmZmY4MDA5YTU2Mj5dIGRvX3NlY2NvbXArMHg2Mi8weDhiZQo+IFvCoMKgIDEwLjQ3ODA3
OV0gWzxmZmZmZmZmZjgwMDlhZjU4Pl0gcHJjdGxfc2V0X3NlY2NvbXArMHgyNC8weDMyCj4gW8Kg
wqAgMTAuNDgzNzI1XSBbPGZmZmZmZmZmODAwMjA3NTY+XSBzeXNfcHJjdGwrMHhmNi8weDQ1MAo+
IFvCoMKgIDEwLjQ4ODc2M10gWzxmZmZmZmZmZjgwMDAzNGYyPl0gcmV0X2Zyb21fc3lzY2FsbCsw
eDAvMHgyCj4gCj4gCj4gVGhlIFBDIHJlZ2lzdGVyIHBvaW50cyB0byB0aGlzIGxpbmU6Cj4gCj4g
KzE6Cj4gK8KgwqDCoCBSRUdfTMKgwqDCoCBhNSwgMChhMSkKClRoYW5rcyBmb3IgdGVzdGluZyEg
RG8geW91IG1pbmQgdGVhY2hpbmcgbWUgaG93IHRvIHJlcHJvZHVjZSB0aGUgZXJyb3I/CgpBa2ly
YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
