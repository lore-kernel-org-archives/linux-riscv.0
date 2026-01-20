Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63732D2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9LGORuxpMAcb+AtHQQ/rCVFAXlrFs2lXPGNFtZgEHE=; b=ecbZwMEsCggDtF
	nNhe1G5NxVvqyuu9s3pfTqFwdahr7GYimg7pMpbZE6Y+b3qH3HxcCZFoMI3b7S3Ef6q0KuAmZ6ryF
	+t9NYCEnDC5Em2OOLUfPBAtAnkfNP5c7GKfddWxBLDEeShmPg7V8c4jfkZwDM7VrxDzLOerjJWOkF
	c2CgHcBdHd1TA946FBOtHmMEouFUIEpfsu2PB2dvxFvrIwSi44EJpQEvE7/D5o/pahQ+TrWvz6WdG
	pac5qrhi0SiQU+GP6EU/dJH9bJSjeK93/XjbxfcfksyjekUKDM2RtxS/VBhvr80uYV8a5xOkusGlo
	a9b4LWKuYOcE715V+nDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Tt-00000003NAt-41CW;
	Tue, 20 Jan 2026 07:48:53 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Tr-00000003NAL-3qgP
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 07:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768895332; x=1800431332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=k0kTOpVAbMSgIAQ+svuxOM9SArLZcXQbklyV/T0JbM4=;
  b=SE6pIb+72+myc2eKIOvitH0O9zMhGRCE6RsATb2HV+rl+Q7EmQhfUZUn
   eC3dQ1xtyfBO070aAS24M7Y9oJJFFBOIdUpVmnSNfCy1D0oYxshF9SgKs
   2WdT7yOUevhgLonVtVapRgGUTtqkHna4uXmpUUwswieKfe4g3o37H+aM2
   WobyZek1KKGyXbuA08ZwrKcDw/8LP4LAbohNznk8xOYSQKI2emfKjBmv7
   icOZ2NRgowpGfcxBaWkehsC6zDHLLzOoglDrOBRDrQPxBjkk4fYimnbl7
   BojGFNyRB3vGu8yESRJu4KOBQq7t1OoY8cXmGAJ3ebLr5g/CcKQhRIC8P
   Q==;
X-CSE-ConnectionGUID: q7fuo1vORPWmOpl80BDNFg==
X-CSE-MsgGUID: RXewCBh7Q2aBCxTpD6FcBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70184357"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70184357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:48:51 -0800
X-CSE-ConnectionGUID: HKKCPH71QCOrf9Cdrgn0gw==
X-CSE-MsgGUID: n4YSA7VTSAehW5YoidIuSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206102045"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:48:46 -0800
Date: Tue, 20 Jan 2026 09:48:43 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, akpm@linux-foundation.org, kees@kernel.org,
	andy@kernel.org, ebiggers@kernel.org, martin.petersen@oracle.com,
	ardb@kernel.org, charlie@rivosinc.com, conor.dooley@microchip.com,
	ajones@ventanamicro.com, linus.walleij@linaro.org,
	nathan@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 5/8] lib/string_kunit: extend benchmarks to strnlen
 and chr searches
Message-ID: <aW8zWxjpVMSTFPYM@smile.fi.intel.com>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-6-jiangfeng@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260120065852.166857-6-jiangfeng@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_234851_966523_9BAE0081 
X-CRM114-Status: UNSURE (   7.07  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgMDI6NTg6NDlQTSArMDgwMCwgRmVuZyBKaWFuZyB3cm90
ZToKPiBFeHRlbmQgdGhlIHN0cmluZyBiZW5jaG1hcmtpbmcgc3VpdGUgdG8gaW5jbHVkZSBzdHJu
bGVuKCksIHN0cmNocigpLAo+IGFuZCBzdHJyY2hyKCkuCj4gCj4gRm9yIGNoYXJhY3RlciBzZWFy
Y2ggZnVuY3Rpb25zIChzdHJjaHIgYW5kIHN0cnJjaHIpLCB0aGUgYmVuY2htYXJrCgpzdHJjaHIo
KSBhbmQgc3RycmNocigpCgo+IHRhcmdldHMgdGhlIG51bGwgdGVybWluYXRvci4gVGhpcyBlbnN1
cmVzIHRoZSBlbnRpcmUgc3RyaW5nIGlzIHNjYW5uZWQsCgpOVUwgY2hhcmFjdGVyCgooQWxzbyBj
aGVjayB0ZXJtaW5vbG9neSBldmVyeXdoZXJlOiBOVUxMIOKAlCBpcyBmb3IgTlVMTCBwb2ludGVy
cywgTlVMIGlzIGZvcgogJ1wwJyBjaGFyYWN0ZXJzLikKCj4gcHJvdmlkaW5nIGEgY29uc2lzdGVu
dCBtZWFzdXJlIG9mIGZ1bGwtbGVuZ3RoIHByb2Nlc3NpbmcgZWZmaWNpZW5jeQo+IGNvbXBhcmFi
bGUgdG8gc3RybGVuKCkuCgpBY2tlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5QGtlcm5lbC5v
cmc+CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
