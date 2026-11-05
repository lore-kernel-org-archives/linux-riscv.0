Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AEE606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yUK05xGm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=RDjGvLhX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:In-Reply-To:Date:Subject:
	Mime-Version:To:Message-Id:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4elyj4TtR/lZYESZ8qzYikcIJpHqSw+OCcEfK/Gb458=; b=yUK05xGmVLccpgbA73YQPGylHC
	mkrZxyw6uV2mGlsCOHjPjhQd+N7o22CNT/DQE9Zckb5+ybvnFKnrDDAmZ26n+pQSa4hNLeUJT72Ai
	OC1Da3YWrLEE3lRmW9XxyX+lJuJUWUyLivff4IonZ7jOZ450+idxj177BJlhjxqw/OPr+kXEW2z/x
	DV7wf9fgVh6rwDH6fi8LJKshLPS1aqHAGKfX97PdiHK2ZKhp7Gx6+OWg923BIl2g5pbuSMbV8ixl0
	7zIpYP7ATeMr1cfkZRIE1ebeZ45dmW6SsfLZLd+UYKlkZzrFepNHXvLOgc7wtgZj1v9QG8qM74hsm
	zvuNB4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsTl-000000085xV-0Zbl;
	Thu, 05 Nov 2026 08:05:49 +0000
Received: from va-2-36.ptr.blmpb.com ([209.127.231.36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsTj-000000085wQ-1ZZW
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793865937; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=TMVq1BdX8FUxH8J6/ZdpU/bSTGJU2bUVnTOmNO2snXM=;
 b=RDjGvLhXr5096VcIf1dKI76qOLL81RWglBqUx7Fc2txhOaQD4D44dUc9V9h03Y3JHY0AB/
 rdjcw8KYRTvj4gtmD7E8WV6eDIry4O3GS3e6iJo8FLCVAeeyp4MW0K6KkZbxjf1GxnR/kr
 z6pv55HEOKchqtWEVfQ/63RWzdtpIDjJST9GnZGr5yxP1XYgfQFXvxS24/oDmeFSIdzSb5
 e/0+WbqpLuvqxoabzdO77VX6iDp5TNb1+ELO9nKm/j3TA9Lft+F3JsP+qkVpo92Zgjb2sx
 txXiZOMx+OA1bo+mdjM+qHoV8ksUWpzpS1pXPHjVNFp9Ey8pCKFwLxvC2JJWIw==
From: "Zeng Heng" <zengheng@picoheart.com>
Message-Id: <02cf71f0-09d5-4dde-a8cf-3739583cc7fa@picoheart.com>
X-Lms-Return-Path: <lba+26aec38cf+8e76e8+lists.infradead.org+zengheng@picoheart.com>
To: "Drew Fustini" <fustini@kernel.org>, 
	"Adrien Ricciardi" <aricciardi@baylibre.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Atish Patra" <atish.patra@linux.dev>, "Babu Moger" <babu.moger@amd.com>, 
	"Ben Horgan" <ben.horgan@arm.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Chen Pei" <cp0613@linux.alibaba.com>, 
	"Conor Dooley" <conor.dooley@microchip.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"Dave Martin" <Dave.Martin@arm.com>, "Fenghua Yu" <fenghuay@nvidia.com>, 
	"Gong Shuai" <gong.shuai@sanechips.com.cn>, 
	"Gong Shuai" <gsh517@gmail.com>, <guo.wenjia23@zte.com.cn>, 
	"James Morse" <james.morse@arm.com>, 
	=?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, <liu.qingtao2@zte.com.cn>, 
	"Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Peter Newman" <peternewman@google.com>, 
	=?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
	"Reinette Chatre" <reinette.chatre@intel.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Samuel Holland" <samuel.holland@sifive.com>, 
	"Sunil V L" <sunilvl@oss.qualcomm.com>, 
	"Tony Luck" <tony.luck@intel.com>, "Weiwei Li" <liwei1518@gmail.com>, 
	"yunhui cui" <cuiyunhui@bytedance.com>, 
	"Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Received: from [172.16.137.224] ([124.160.26.250]) by smtp.feishu.cn with ESMTPS; Thu, 05 Nov 2026 16:05:34 +0800
X-Original-From: Zeng Heng <zengheng@picoheart.com>
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/6] riscv_cbqri: resctrl: Add cache allocation via capacity block mask
Date: Thu, 5 Nov 2026 16:05:29 +0800
In-Reply-To: <20261104-dfustini-atl-sc-cbqri-dt-v10-2-1636a003a3c0@kernel.org>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>, 
	"Jonathan Cameron" <jic23@kernel.org>, 
	"Shaopeng Tan" <tan.shaopeng@jp.fujitsu.com>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<x86@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-doc@vger.kernel.org>, <yang.yicong@picoheart.com>, 
	<geshijian@picoheart.com>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org> <20261104-dfustini-atl-sc-cbqri-dt-v10-2-1636a003a3c0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_000547_632153_BC61488C 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRHJldywKCgrlnKggMTEvNS8yNiDkuIrljYgxMjozNSwgRHJldyBGdXN0aW5pIOWGmemBkzoK
Ci4uLgoKPiArLyoKPiArICogRmlsbCB0aGUgcmR0X3Jlc291cmNlIGZpZWxkcyBmb3Igb25lIHBp
Y2tlZCByaWQuIEFuIHJpZCB3aXRoIG5vIHBpY2tlZAo+ICsgKiBjb250cm9sbGVyIGlzIGxlZnQg
dW50b3VjaGVkIHNvIGl0IHN0YXlzIG91dCBvZiByZXNjdHJsX2FyY2hfZ2V0X3Jlc291cmNlKCku
Cj4gKyAqLwo+ICtzdGF0aWMgdm9pZCBjYnFyaV9yZXNjdHJsX2NvbnRyb2xfaW5pdChzdHJ1Y3Qg
Y2JxcmlfcmVzY3RybF9yZXMgKmNicXJpX3JlcykKPiArewo+ICsJc3RydWN0IHJkdF9yZXNvdXJj
ZSAqcmVzID0gJmNicXJpX3Jlcy0+cmVzY3RybF9yZXM7Cj4gKwlzdHJ1Y3QgY2JxcmlfY29udHJv
bGxlciAqY3RybDsKPiArCj4gKwlpZiAoIWNicXJpX3Jlcy0+bnJfY3RybHMpCj4gKwkJcmV0dXJu
Owo+ICsJY3RybCA9IGNicXJpX3Jlcy0+Y3RybHNbMF07Cj4gKwo+ICsJc3dpdGNoIChyZXMtPnJp
ZCkgewo+ICsJY2FzZSBSRFRfUkVTT1VSQ0VfTDI6Cj4gKwljYXNlIFJEVF9SRVNPVVJDRV9MMzoK
PiArCQlyZXMtPm5hbWUgPSAocmVzLT5yaWQgPT0gUkRUX1JFU09VUkNFX0wyKSA/ICJMMiIgOiAi
TDMiOwo+ICsJCXJlcy0+c2NoZW1hX2ZtdCA9IFJFU0NUUkxfU0NIRU1BX0JJVE1BUDsKPiArCQly
ZXMtPmN0cmxfc2NvcGUgPSAocmVzLT5yaWQgPT0gUkRUX1JFU09VUkNFX0wyKSA/Cj4gKwkJCQkg
ICAgUkVTQ1RSTF9MMl9DQUNIRSA6IFJFU0NUUkxfTDNfQ0FDSEU7Cj4gKwkJcmVzLT5jYWNoZS5j
Ym1fbGVuID0gY3RybC0+Y2MubmNibGtzOwo+ICsJCXJlcy0+Y2FjaGUuc2hhcmVhYmxlX2JpdHMg
PSAwOwo+ICsJCXJlcy0+Y2FjaGUubWluX2NibV9iaXRzID0gMTsKPiArCQlyZXMtPmNhY2hlLmFy
Y2hfaGFzX3NwYXJzZV9iaXRtYXNrcyA9IGZhbHNlOwoKQ3VycmVudGx5LCB0aGUgZHJpdmVyIHNl
dHMgYXJjaF9oYXNfc3BhcnNlX2JpdG1hc2tzIHRvIGZhbHNlLCBjYXVzaW5nCnJlc2N0cmwgdG8g
cmVxdWlyZSBhIGNvbnRpZ3VvdXMgYml0cyBpbiBjYWNoZSBhbGxvY2F0aW9uIG1hc2tzLiBGb3IK
ZXhhbXBsZSwgTDM6MD0zIGlzIGFjY2VwdGVkLCB3aGVyZWFzIEwzOjA9MTEgaXMgcmVqZWN0ZWQg
YmVjYXVzZSBpdHMKc2V0IGJpdHMgYXJlIG5vbi1jb250aWd1b3VzLgoKVGhlIGRlZmF1bHQgc2hv
dWxkIGFsbG93IGJvdGggY29udGlndW91cyBhbmQgbm9uLWNvbnRpZ3VvdXMgbWFza3MsCnByb3Zp
ZGVkIHRoZXkgc2F0aXNmeSB0aGUgb3RoZXIgbWFzayB2YWxpZGl0eSBjaGVja3MuIEEgY29udGln
dWl0eQpyZXN0cmljdGlvbiBzaG91bGQgb25seSBiZSBpbXBvc2VkIHdoZW4gYSBzcGVjaWZpYyBo
YXJkd2FyZQppbXBsZW1lbnRhdGlvbiBjYW4ndCBzdXBwb3J0IHNwYXJzZSBtYXNrcyBleHBsaWNp
dGx5LgoKU28gSSBwcm9wb3NlIGVuYWJsaW5nIHNwYXJzZSBjYWNoZSBhbGxvY2F0aW9uIGJpdG1h
c2tzIGJ5IGRlZmF1bHQuClRoYW5rcy4KCj4gKwkJcmVzLT5jZHBfY2FwYWJsZSA9IGN0cmwtPmNj
LnN1cHBvcnRzX2FsbG9jX2F0X2NvZGU7Cj4gKwkJcmVzLT5hbGxvY19jYXBhYmxlID0gY3RybC0+
YWxsb2NfY2FwYWJsZTsKPiArCQlJTklUX0xJU1RfSEVBRCgmcmVzLT5jdHJsX2RvbWFpbnMpOwo+
ICsJCUlOSVRfTElTVF9IRUFEKCZyZXMtPm1vbl9kb21haW5zKTsKPiArCQlicmVhazsKPiArCWRl
ZmF1bHQ6Cj4gKwkJYnJlYWs7Cj4gKwl9Cj4gK30KCkFwYXJ0IGZyb20gdGhpcywKClJldmlld2Vk
LWJ5OiBaZW5nIEhlbmcgPHplbmdoZW5nQHBpY29oZWFydC5jb20+CgoKQmVzdCByZWdhcmRzLApa
ZW5nIEhlbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
