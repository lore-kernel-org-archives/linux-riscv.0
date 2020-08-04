Return-Path: <SRS0=zqIG=BO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22773C433DF
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2020 15:55:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFB43208A9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2020 15:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RRMSVSR6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFB43208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ohrJdNWihFWnzQRohq45t7bPM9hhE+LLnKOc3Lxl6iA=; b=RRMSVSR6DDFspDWsPwzYrJqh6
	qxh7r+b92kbXHlENYYmzLKya4iJEXUyEo30uQW5e36TCVNDyfNSlQEkGz5Z15YaFqK+on2WQeCYo6
	EYCFoJyN25+KSsw6CuvXN0eu6xGsAHQL/t8srHJvD9k4zSGkL+RU5zNTE7Ij4s1PncRh7Ua0mxmZh
	swu9YYgLIu8UI4j1a/AgrUts+4HWgei9s8cg66CU24KzcbSrk1vYGKpScqQRwhbNhcv/q3yHGSB8/
	ky7SK90kRz/5TD5KEsLlmpUZ6PbA+cSsAu5hbLlrKQ73yzVUwrft10RG30/B0TRL2x65TPqlRxx2a
	5KZdV9ksw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2zHd-0002QF-NE; Tue, 04 Aug 2020 15:55:21 +0000
Received: from hera.aquilenet.fr ([2a0c:e300::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2zHb-0002Pk-BE
 for linux-riscv@lists.infradead.org; Tue, 04 Aug 2020 15:55:20 +0000
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 7450B1689;
 Tue,  4 Aug 2020 17:35:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNp9mwS61FzL; Tue,  4 Aug 2020 17:35:43 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id A37C4154E;
 Tue,  4 Aug 2020 17:35:43 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1k2yyc-00278t-Dr; Tue, 04 Aug 2020 17:35:42 +0200
Date: Tue, 4 Aug 2020 17:35:42 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Greg KH <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] speakup: only build serialio when ISA is enabled
Message-ID: <20200804153542.zowupa4ygdgxnciu@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, speakup@linux-speakup.org
References: <20200804111332.dex7jobmabifdzw5@function>
 <20200804113413.GA181242@kroah.com>
 <20200804114951.ijs3hnezi4f64nll@function>
 <20200804115817.GC203147@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804115817.GC203147@kroah.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_115519_500854_F1357B54 
X-CRM114-Status: GOOD (  10.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: speakup@linux-speakup.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

R3JlZyBLSCwgbGUgbWFyLiAwNCBhb8O7dCAyMDIwIDEzOjU4OjE3ICswMjAwLCBhIGVjcml0Ogo+
IAlFUlJPUjogbW9kcG9zdDogInNwa19zZXJpYWxfaW9fb3BzIiBbZHJpdmVycy9hY2Nlc3NpYmls
aXR5L3NwZWFrdXAvc3BlYWt1cF9rZXlwYy5rb10gdW5kZWZpbmVkIQo+IAlFUlJPUjogbW9kcG9z
dDogInNwa19zdG9wX3NlcmlhbF9pbnRlcnJ1cHQiIFtkcml2ZXJzL2FjY2Vzc2liaWxpdHkvc3Bl
YWt1cC9zcGVha3VwX2tleXBjLmtvXSB1bmRlZmluZWQhCgpPaCwgaW5kZWVkLCB0aGVzZSBhcmUg
bm90IGNvdmVyZWQgYnkgdGhlIGZpcnN0IHBhdGNoLgoKSSByZWFsaXplIHRoYXQgS0VZUEMgZGVw
ZW5kcyBvbiBJU0EsIGJ1dCB3aXRoIENPTVBJTEVfVEVTVCBhcwphbHRlcm5hdGl2ZS4gV2UgY2Fu
IGJ1aWxkIHNlcmlhbGlvIGluIHRoZSBDT01QSUxFX1RFU1QgY2FzZSB0b28sIEknbGwKdXBkYXRl
IHRoZSBwYXRjaGVzLgoKQnV0IHRoZW4gd2UnbGwgc3RpbGwgaGF2ZToKCj4gdGhlIHJpc2N2IGJ1
aWxkIGlzc3Vlcy4KCkFjdHVhbGx5IEkgd2FzIHN1cnByaXNlZCBieSB0aGUgcmlzY3YgYnVpbGQg
aXNzdWU6IHRoZSBpc3N1ZSBpcyB3aXRoaW4KcmlzY3YncyBpbmIoKSBpbXBsZW1lbnRhdGlvbiwg
c2VyaWFsaW8uYyBpcyBvbmx5IGNhbGxpbmcgaXQuCmFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW8u
aCBzYXlzOgoKI2RlZmluZSBQQ0lfSU9CQVNFCQkoKHZvaWQgX19pb21lbSAqKVBDSV9JT19TVEFS
VCkKWy4uLl0KI2RlZmluZSBpbmIoYykJCSh7IHU4ICBfX3Y7IF9faW9fcGJyKCk7IF9fdiA9IHJl
YWRiX2NwdSgodm9pZCopKFBDSV9JT0JBU0UgKyAoYykpKTsgX19pb19wYXIoX192KTsgX192OyB9
KQoKYW5kIHRodXMgeWVzIGl0J3MgYXJpdGhtZXRpYyBvdmVyIGEgKHZvaWQqKSBwb2ludGVyLCB0
aGUgY2FsbGVyIGNhbm5vdApkbyBhbnl0aGluZyBhYm91dCBpdC4KCjgyNTBfcG9ydC5jIGl0c2Vs
ZiB1c2VzIGluYigpLCBkb2Vzbid0IGl0IGdldCBhIHdhcm5pbmcgYXMgd2VsbD8gT3IgaXMKaXQg
Z2V0dGluZyBjb21waWxlZC1vdXQgb24gcmlzY3YgYmVjYXVzZSBvZiBzb21lIEtjb25maWcgY29u
ZGl0aW9uPyAgSQpzZWUgdGhhdCB0aGUgd2hvbGUgZHJpdmVycy90dHkvc2VyaWFsIGlzIHVuZGVy
IEhBU19JT01FTSwgYW5kIHRoYXQncyB0aGUKb25seSBjb25kaXRpb24gSSBjYW4gc2VlIGZvciA4
MjUwX3BvcnQuYyAoZXhjZXB0IFNFUklBTF84MjUwIG9mIGNvdXJzZSksCmlzIHRoYXQgaXQsIG9y
IGlzIFNFUklBTF84MjUwIGp1c3Qgbm90IGVuYWJsZWQgaW4gdGhlIHJpc2N2IGJvdD8KCkFjdHVh
bGx5IHRoZSB3YXJuaW5nIHNlZW1zIG5ldywgd2hlbiBsb29raW5nIGF0IHRoZSBEZWJpYW4gYnVp
bGQgbG9nOgoKaHR0cHM6Ly9idWlsZGQuZGViaWFuLm9yZy9zdGF0dXMvZmV0Y2gucGhwP3BrZz1s
aW51eCZhcmNoPXJpc2N2NjQmdmVyPTUuNy4xMC0xJnN0YW1wPTE1OTU4MDM0OTkmcmF3PTAKCmFu
ZCBsb29raW5nIGZvciBzZXJpYWxpby5jLCBJIGRvIG5vdCBzZWUgYSB3YXJuaW5nLCBhbmQgaXRz
IGNvZGUgaGFzbid0CmNoYW5nZWQuIElzIHRoZSBidWlsZCBib3QgY29tcGlsZXIganVzdCBtb3Jl
IHRhbGthdGl2ZT8KClNhbXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
