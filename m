Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58949606A33D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nt6JhdjU;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BFFu1MCk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SMh3djfNp31t8EKsYhop5MHvKaOSQkP8VwxCUVvSwKM=; b=nt6JhdjUi26tplsc/jAXvH2QeX
	E7hwlYkprJ0Q0gMqzS5veO4K96DVMRxdYk63S6bQ3qH60NHXPqBcS+AMfV8Q5Trc27HnPKgny8gTD
	cKIFz9CRLkBvmhbnVkT9UPolC3YKeJe3FJCbnsSQ80bcLbW+XYhYJ8IpgCj+QbZ4490o98R22CleT
	r0h2oeUPmwo+kSL+NHBOFnNnaQVGudFDc/AwmMRrl7Y5dtK9liQjN0l1i80Mfl3LEFwLB8InxbdK4
	B+EB0wMuSMD6hwMc7PsG7n6uHTVEcLFiiGi/6PlAJJQopKf81IysFwyE0InB0Gpk+Ei4DMSM4f+um
	axZRmzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2TS-0000000C7HX-0ozQ;
	Thu, 19 Nov 2026 13:46:50 +0000
Received: from out-105.mta1.migadu.com ([95.215.58.105] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2TP-0000000C7GW-0fG1
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 13:46:48 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=++jxRWVPeWHHNOse9hUX9VVHA8pC7zSS/WWi8a/OqNw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795096004; v=1; x=1795700804;
 b=BFFu1MCkYDNvS1QBOd5lfM7XsW1mMv06+SULHYpVMq7qtH+10lOdRlpTXISGV6TiSnMuBcFc
 skn6vs9IegdwLkYMZuuYzEpnRnLF9NLyjRQnhIp78mxyGtNgCkxdl38pbXyb4fbcbk6/wca4zUS
 e9MVHuQ3frEjO2yzdIuht1cM=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 799fbb2e29e87772;
	Thu, 19 Nov 2026 13:46:44 +0000
X-Mizu-Trace-ID: 799fbb2e29e87772
X-Migadu-Flow: FLOW_OUT
Message-ID: <69a099c3-082e-43b8-82f5-122d32df5eff@linux.dev>
Date: Thu, 19 Nov 2026 14:46:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 06/11] riscv: enable NMI-safe lockdep irqflags
 tracking
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 himanshu.chauhan@oss.qualcomm.com, conor@kernel.org,
 anup.patel@oss.qualcomm.com
Cc: cuiyunhui@bytedance.com, atish.patra@linux.dev, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
 will@kernel.org, tglx@kernel.org, corbet@lwn.net, rdunlap@infradead.org,
 shuah@kernel.org, yuanzhu@bytedance.com, yang.susheng@zte.com.cn,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
 <20261119120824.13969-19-zhangzhanpeng.jasper@bytedance.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261119120824.13969-19-zhangzhanpeng.jasper@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_054647_432350_75C86D82 
X-CRM114-Status: GOOD (  18.32  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMS8xOS8yNiAxMzowOCwgWmhhbnBlbmcgWmhhbmcgd3JvdGU6Cj4gQW4gU1NFIGhhbmRs
ZXIgcnVucyB3aXRoIGludGVycnVwdHMgbWFza2VkLCBidXQgY2FuIGludGVycnVwdCBjb2RlIHdo
b3NlCj4gbG9ja2RlcCBoYXJkaXJxIHN0YXRlIGlzIGVuYWJsZWQuIEJhcmUgbm1pX2VudGVyKCkv
bm1pX2V4aXQoKSBkbyBub3QKPiB1cGRhdGUgdGhhdCBzdGF0ZS4gQ29uc2VxdWVudGx5LCBsb2Nr
ZGVwX2Fzc2VydF9pcnFzX2Rpc2FibGVkKCkgaW4gdGhlCj4gcGVyZiBvdmVyZmxvdyBwYXRoIGNh
biByZXBvcnQgYSB3YXJuaW5nIGRlc3BpdGUgaW50ZXJydXB0cyBiZWluZyBtYXNrZWQuCj4gCj4g
U2VsZWN0IFRSQUNFX0lSUUZMQUdTX05NSV9TVVBQT1JUIHNvIGxvY2tkZXAgY2FuIHVwZGF0ZSBp
dHMgaGFyZGlycSBzdGF0ZQo+IGluc2lkZSBhbiBOTUkuIFBhaXIgdGhpcyB3aXRoIGlycWVudHJ5
X25taV9lbnRlcigpL2lycWVudHJ5X25taV9leGl0KCkgaW4KPiB0aGUgU1NFIHdyYXBwZXI6IHRo
ZXNlIGhlbHBlcnMgc2F2ZSB0aGUgcHJldmlvdXMgdHJhY2tlZCBzdGF0ZSwgbWFyawo+IGludGVy
cnVwdHMgZGlzYWJsZWQgb24gZW50cnkgYW5kIHJlc3RvcmUgdGhlIHRyYWNrZWQgc3RhdGUgb24g
ZXhpdC4KPiBTZWxlY3RpbmcgdGhlIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGFsb25lIGRvZXMgbm90
IHBlcmZvcm0gdGhvc2UgdXBkYXRlcy4KPiBUaGlzIGZvbGxvd3MgdGhlIGVudHJ5IGhlbHBlcnMg
dXNlZCBieSB0aGUgb3RoZXIgUklTQy1WIE5NSS1saWtlIHRyYXBzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFpoYW5wZW5nIFpoYW5nIDx6aGFuZ3poYW5wZW5nLmphc3BlckBieXRlZGFuY2UuY29tPgo+
IC0tLQo+ICAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgIHwgMSArCj4gICBhcmNoL3Jpc2N2
L2tlcm5lbC9zYmlfc3NlLmMgfCA3ICsrKystLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tj
b25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCBkMmRiOGY0MGM2MTYuLjU1MDFjMDJh
MDdlYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2
L0tjb25maWcKPiBAQCAtMjI1LDYgKzIyNSw3IEBAIGNvbmZpZyBSSVNDVgo+ICAgCXNlbGVjdCBT
WVNDVExfRVhDRVBUSU9OX1RSQUNFCj4gICAJc2VsZWN0IFRIUkVBRF9JTkZPX0lOX1RBU0sKPiAg
IAlzZWxlY3QgVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVAo+ICsJc2VsZWN0IFRSQUNFX0lSUUZMQUdT
X05NSV9TVVBQT1JUCj4gICAJc2VsZWN0IFVBQ0NFU1NfTUVNQ1BZIGlmICFNTVUKPiAgIAlzZWxl
Y3QgVkRTT19EQVRBU1RPUkUgaWYgTU1VCj4gICAJc2VsZWN0IFZEU09fR0VUUkFORE9NIGlmIE1N
VSAmJiA2NEJJVAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmlfc3NlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zYmlfc3NlLmMKPiBpbmRleCAwMzJmY2MwN2FiY2YuLjU5ZTQ3YTM5
NTg5ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmlfc3NlLmMKPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zYmlfc3NlLmMKPiBAQCAtMiw3ICsyLDcgQEAKPiAgIC8qCj4gICAg
KiBDb3B5cmlnaHQgKEMpIDIwMjUgUml2b3MgSW5jLgo+ICAgICovCj4gLSNpbmNsdWRlIDxsaW51
eC9ubWkuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2VudHJ5LWNvbW1vbi5oPgo+ICAgI2luY2x1ZGUg
PGxpbnV4L3NjaGVkLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvc2NzLmg+Cj4gICAjaW5jbHVkZSA8
bGludXgvYml0ZmllbGQuaD4KPiBAQCAtMzYsOSArMzYsMTAgQEAgdm9pZCBub2luc3RyIGRvX3Nz
ZShzdHJ1Y3Qgc3NlX2V2ZW50X2FyY2hfZGF0YSAqYXJjaF9ldnQsCj4gICB7Cj4gICAJc3RydWN0
IHJpc2N2X3NzZV9pbnRlcnJ1cHRlZF9jb250ZXh0IGNvbnRleHQgPSB7IHJlZ3MsIGhzdGF0dXMg
fTsKPiAgIAlzdHJ1Y3QgcmlzY3Zfc3NlX2ludGVycnVwdGVkX2NvbnRleHQgKnByZXZpb3VzOwo+
ICsJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZTsKPiAgIAlzdHJ1Y3Qgc2JpcmV0IHNyZXQ7Cj4gICAK
PiAtCW5taV9lbnRlcigpOwo+ICsJc3RhdGUgPSBpcnFlbnRyeV9ubWlfZW50ZXIocmVncyk7Cj4g
ICAJaW5zdHJ1bWVudGF0aW9uX2JlZ2luKCk7Cj4gICAKPiAgIAkvKiBSZXRyaWV2ZSBtaXNzaW5n
IEdQUnMgZnJvbSBTQkkgKi8KPiBAQCAtODQsNyArODUsNyBAQCB2b2lkIG5vaW5zdHIgZG9fc3Nl
KHN0cnVjdCBzc2VfZXZlbnRfYXJjaF9kYXRhICphcmNoX2V2dCwKPiAgIAo+ICAgb3V0Ogo+ICAg
CWluc3RydW1lbnRhdGlvbl9lbmQoKTsKPiAtCW5taV9leGl0KCk7Cj4gKwlpcnFlbnRyeV9ubWlf
ZXhpdChyZWdzLCBzdGF0ZSk7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkICphbGxvY190b19z
dGFja19wb2ludGVyKHZvaWQgKmFsbG9jKQoKSGkgWmhhbnBlbmcsCgpOb3Qgc3VyZSBpZiBpdCB3
YXMgYWxyZWFkeSBzdWdnZXN0ZWQgYnV0IEkgd291bGQgZm9sZCB0aGF0IGluIHRoZSBjb21taXQg
CmFkZGluZyBTU0UgaXRzZWxmLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
