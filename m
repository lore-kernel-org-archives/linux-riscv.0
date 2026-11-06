Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F763606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cj/4U25H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LhgmYRf9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DSZbh3dBIihzVn3XrJgH+n2ga4vEIrHqHkZCWMmeX2E=; b=Cj/4U25HjV8TLaxnYW1XVUbgng
	InOch8VRFIY07YR1UBypKydIeQ+AqRy8D1hLChBE780IESYW5SCnNWUuK69mGQHlMYKUu8BAy+p8a
	hQCvQVmjxCByPV4ocuU+938zSBIDyJ7kn9q+dMk/Ea9JGx24M0bwY7LlcWFAx6NuuCVcOf6bemskP
	op6g19QaSYk0w3lgVNXxsZceUvcKbf5PZ5wS/xX0DFDTB76J5yMVLWXnKCA4S65t2oVeQiIGTZoi2
	2oED0Dnu23/x/10LwfksiGB0jlboI+097cJhVJSc+wZ2eluIW+LEjRd7fza8CvWbpHpyhIHnS8v8K
	ocfbfTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNNg-0000000DAA7-28yc;
	Fri, 06 Nov 2026 17:05:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNNf-0000000DA9x-1zKN
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 17:05:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABB9E4044A;
	Fri,  6 Nov 2026 17:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D2E1F008A5;
	Fri,  6 Nov 2026 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793984734;
	bh=JTlEFod2cjgS0LbAQsWexRzCJ68NZr8rhNXABouJAQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LhgmYRf9RsD3jkt7XP0j5x6GVceyzZdxPZmBiATz86t4GWKKDfCr1RMuHVQsjnhKD
	 K8hy6v4vBlzaZp8HABomM9YNM5Z2QB91duA/38Ni68uWbp1fKrWiZfq7CMnVN4/DQx
	 4EQEtE84c9EfXGKcRhG88yib2HD5bjNrAgUmxjSfsrUNomwyyRUW6ENDJYFrI7sITI
	 JoLR2yWeFvuJKN+DixGTRz0GQmsFknUviXNyag+oj13tq7yywSBdYxXvj69WU+OaYk
	 2/hJ6Dh6lTz1ItTt+ownJdJdTjfELbifbUKhCJ/qeOOrj+uhKg5rw+Kzb6NkNfnrtH
	 qA8BiWPOgyufQ==
Date: Fri, 6 Nov 2026 09:05:32 -0800
From: Drew Fustini <fustini@kernel.org>
To: Zeng Heng <zengheng@picoheart.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, yang.yicong@picoheart.com,
	geshijian@picoheart.com
Subject: Re: [PATCH v10 2/6] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <au4I3E_qcPhIr-Qr@thelio>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
 <20261104-dfustini-atl-sc-cbqri-dt-v10-2-1636a003a3c0@kernel.org>
 <02cf71f0-09d5-4dde-a8cf-3739583cc7fa@picoheart.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02cf71f0-09d5-4dde-a8cf-3739583cc7fa@picoheart.com>
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMDUsIDIwMjYgYXQgMDQ6MDU6MjlQTSArMDgwMCwgWmVuZyBIZW5nIHdyb3Rl
Ogo+IEhpIERyZXcsCgpIaSwgdGhhbmtzIGZvciByZXZpZXdpbmcuCgo+IOWcqCAxMS81LzI2IOS4
iuWNiDEyOjM1LCBEcmV3IEZ1c3Rpbmkg5YaZ6YGTOgo+IAo+IC4uLgo+IAo+ID4gKy8qCj4gPiAr
ICogRmlsbCB0aGUgcmR0X3Jlc291cmNlIGZpZWxkcyBmb3Igb25lIHBpY2tlZCByaWQuIEFuIHJp
ZCB3aXRoIG5vIHBpY2tlZAo+ID4gKyAqIGNvbnRyb2xsZXIgaXMgbGVmdCB1bnRvdWNoZWQgc28g
aXQgc3RheXMgb3V0IG9mIHJlc2N0cmxfYXJjaF9nZXRfcmVzb3VyY2UoKS4KPiA+ICsgKi8KPiA+
ICtzdGF0aWMgdm9pZCBjYnFyaV9yZXNjdHJsX2NvbnRyb2xfaW5pdChzdHJ1Y3QgY2JxcmlfcmVz
Y3RybF9yZXMgKmNicXJpX3JlcykKPiA+ICt7Cj4gPiArCXN0cnVjdCByZHRfcmVzb3VyY2UgKnJl
cyA9ICZjYnFyaV9yZXMtPnJlc2N0cmxfcmVzOwo+ID4gKwlzdHJ1Y3QgY2JxcmlfY29udHJvbGxl
ciAqY3RybDsKPiA+ICsKPiA+ICsJaWYgKCFjYnFyaV9yZXMtPm5yX2N0cmxzKQo+ID4gKwkJcmV0
dXJuOwo+ID4gKwljdHJsID0gY2JxcmlfcmVzLT5jdHJsc1swXTsKPiA+ICsKPiA+ICsJc3dpdGNo
IChyZXMtPnJpZCkgewo+ID4gKwljYXNlIFJEVF9SRVNPVVJDRV9MMjoKPiA+ICsJY2FzZSBSRFRf
UkVTT1VSQ0VfTDM6Cj4gPiArCQlyZXMtPm5hbWUgPSAocmVzLT5yaWQgPT0gUkRUX1JFU09VUkNF
X0wyKSA/ICJMMiIgOiAiTDMiOwo+ID4gKwkJcmVzLT5zY2hlbWFfZm10ID0gUkVTQ1RSTF9TQ0hF
TUFfQklUTUFQOwo+ID4gKwkJcmVzLT5jdHJsX3Njb3BlID0gKHJlcy0+cmlkID09IFJEVF9SRVNP
VVJDRV9MMikgPwo+ID4gKwkJCQkgICAgUkVTQ1RSTF9MMl9DQUNIRSA6IFJFU0NUUkxfTDNfQ0FD
SEU7Cj4gPiArCQlyZXMtPmNhY2hlLmNibV9sZW4gPSBjdHJsLT5jYy5uY2Jsa3M7Cj4gPiArCQly
ZXMtPmNhY2hlLnNoYXJlYWJsZV9iaXRzID0gMDsKPiA+ICsJCXJlcy0+Y2FjaGUubWluX2NibV9i
aXRzID0gMTsKPiA+ICsJCXJlcy0+Y2FjaGUuYXJjaF9oYXNfc3BhcnNlX2JpdG1hc2tzID0gZmFs
c2U7Cj4gCj4gQ3VycmVudGx5LCB0aGUgZHJpdmVyIHNldHMgYXJjaF9oYXNfc3BhcnNlX2JpdG1h
c2tzIHRvIGZhbHNlLCBjYXVzaW5nCj4gcmVzY3RybCB0byByZXF1aXJlIGEgY29udGlndW91cyBi
aXRzIGluIGNhY2hlIGFsbG9jYXRpb24gbWFza3MuIEZvcgo+IGV4YW1wbGUsIEwzOjA9MyBpcyBh
Y2NlcHRlZCwgd2hlcmVhcyBMMzowPTExIGlzIHJlamVjdGVkIGJlY2F1c2UgaXRzCj4gc2V0IGJp
dHMgYXJlIG5vbi1jb250aWd1b3VzLgo+IAo+IFRoZSBkZWZhdWx0IHNob3VsZCBhbGxvdyBib3Ro
IGNvbnRpZ3VvdXMgYW5kIG5vbi1jb250aWd1b3VzIG1hc2tzLAo+IHByb3ZpZGVkIHRoZXkgc2F0
aXNmeSB0aGUgb3RoZXIgbWFzayB2YWxpZGl0eSBjaGVja3MuIEEgY29udGlndWl0eQo+IHJlc3Ry
aWN0aW9uIHNob3VsZCBvbmx5IGJlIGltcG9zZWQgd2hlbiBhIHNwZWNpZmljIGhhcmR3YXJlCj4g
aW1wbGVtZW50YXRpb24gY2FuJ3Qgc3VwcG9ydCBzcGFyc2UgbWFza3MgZXhwbGljaXRseS4KPiAK
PiBTbyBJIHByb3Bvc2UgZW5hYmxpbmcgc3BhcnNlIGNhY2hlIGFsbG9jYXRpb24gYml0bWFza3Mg
YnkgZGVmYXVsdC4KPiBUaGFua3MuCgpHb29kIHBvaW50LCBJIHdpbGwgY2hhbmdlIGFyY2hfaGFz
X3NwYXJzZV9iaXRtYXNrcyB0byB0cnVlLiBUaGUgc3BlYwpkZWZpbmVzIGNjX2Jsb2NrX21hc2sg
YXMgb25lIGJpdCBwZXIgY2FwYWNpdHkgYmxvY2sgYW5kIHRoZXJlJ3Mgbm8KY29udGlndWl0eSBy
ZXF1aXJlbWVudC4KCj4gPiArCQlyZXMtPmNkcF9jYXBhYmxlID0gY3RybC0+Y2Muc3VwcG9ydHNf
YWxsb2NfYXRfY29kZTsKPiA+ICsJCXJlcy0+YWxsb2NfY2FwYWJsZSA9IGN0cmwtPmFsbG9jX2Nh
cGFibGU7Cj4gPiArCQlJTklUX0xJU1RfSEVBRCgmcmVzLT5jdHJsX2RvbWFpbnMpOwo+ID4gKwkJ
SU5JVF9MSVNUX0hFQUQoJnJlcy0+bW9uX2RvbWFpbnMpOwo+ID4gKwkJYnJlYWs7Cj4gPiArCWRl
ZmF1bHQ6Cj4gPiArCQlicmVhazsKPiA+ICsJfQo+ID4gK30KPiAKPiBBcGFydCBmcm9tIHRoaXMs
Cj4gCj4gUmV2aWV3ZWQtYnk6IFplbmcgSGVuZyA8emVuZ2hlbmdAcGljb2hlYXJ0LmNvbT4KClRo
YW5rcyEKCkRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
