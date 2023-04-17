Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AD5C77B72
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 19:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=f8EPSgEBjBrB0Hz4J37rvTV/11gV7/6tIQpuEXj3o7U=; b=271JnEPR5bj/agia0G6hqHraJQ
	vxCy1zyET/magiqhzT/bYJJaJyMEvPQq/TKVW49dGs6VLBh2Z9lTHHNuERyziJUoyAQ0Pm62uCliH
	zhtuyJ04P6FCkTzR05EHplrct3ArMFtC981RtDJUDPnArQZfGk7yTneM4HaUfDiulDYrK6TbRSG2h
	iZzkSrxQ0XJU7WICyHOFf8WMyyzLiqWQcE1Aq8abWhLaME2idJo5/R6rhONr80Oqf2IGYUpi8pVaW
	jF80GwzOJdGNKqEH3P9EBTTO0iRE4jB/CcZtepb2XWFKwuQig+cR80u/1kACVBKKrM7bbf48R1Z1V
	Jwsc/h9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poUd7-00HRWO-21;
	Mon, 17 Apr 2023 19:35:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poUd5-00HRVq-0V
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 19:35:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id o2so26943598plg.4
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 12:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681760109; x=1684352109;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXrDQCneSb8jgaB5WOV1RqaoODncwrujP+Iw89BILhs=;
        b=O5dg6sOfwLf72QhLfcA5JPZKGpC9v3EPOX2y0AYcP7Il8gcym2sV8o5lhXHrPSGiGW
         DPGhkhxCJAOGPQHDgIJQWDZgMpZ18zws9m2PU3filA4f04zZ/ATq8zPp2oc0CvIEZOx4
         aS6Dmvqfg1ZBUBAHKCZGkO1qU4Za622yPoSyVVfHHKSW/NNIp8JEewzQlEvRUxd26zgx
         c3D57alEVgMwcn82DCHEwvxiO+Gj6jb3vWycOEc2eSWxLW3VrVDVPARr/jOUFRnCXL2R
         HCsjeToQ1OnDlO+wynHZo/8xZeVoZoCrR1W37oblagNvZ1Qy78o/cJdejEHoycqWtbfQ
         venQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681760109; x=1684352109;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXrDQCneSb8jgaB5WOV1RqaoODncwrujP+Iw89BILhs=;
        b=MBnBvTJL8jjnXK7o0VrkZPNEWMDzjrV74XoGQ4SfxZXhYEW2ICIPsey+CnTtR2NyNQ
         J5IeozLEvb0F5gR/wvHMOSaArgoSqy589nRWYR6oexIgc9uIwmVI9IxxAv2vXMyG7XVb
         HFBkaboXWNCnaIy0o9CmVkg37BD9wOWuqPF/eIhOQV0lVzTErfQ+xGhP4sA/gbexZAIv
         osa8NZbKPzoRVrFh551D3d+LdT/o6J1/oA0h3V3R1bFTaegfmoOrp76VtEx4cT5lMeq2
         evpfkRdGB6/vy91p3zd13QVtqcWcwMozqdDidkRZSrC09a4U/DzjsTRqukxZ9/mxKNdM
         MbbA==
X-Gm-Message-State: AAQBX9dF+CBaXC1/kMKF/z4As5CxwjeAXUSUdhDJbvh3bifzijGyMuCP
	/mWK8nMU6mtJZI2LBd9g0aC/Gw==
X-Google-Smtp-Source: AKy350ZgkvMBwxuvsB2Nzf72S0ZpG/7AYjuh89fy8y1Y+VJOMWc5KS3m/VSnzQO/xLsTnbpfVXYkiA==
X-Received: by 2002:a17:90a:2a41:b0:247:c0bd:b99a with SMTP id d1-20020a17090a2a4100b00247c0bdb99amr597549pjg.31.1681760109163;
        Mon, 17 Apr 2023 12:35:09 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b10-20020a17090a800a00b002479c36b10esm1828978pjn.23.2023.04.17.12.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 12:35:08 -0700 (PDT)
Date: Mon, 17 Apr 2023 12:35:08 -0700 (PDT)
X-Google-Original-Date: Mon, 17 Apr 2023 12:34:57 PDT (-0700)
Subject: Re: [PATCH 2/6] tools/nolibc: riscv: add stackprotector support
In-Reply-To: <20230408-nolibc-stackprotector-archs-v1-2-271f5c859c71@weissschuh.net>
CC: w@1wt.eu, shuah@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux@weissschuh.net
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux@weissschuh.net
Message-ID: <mhng-1ec176a9-ec5d-470b-a278-a4e9cec728a8@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_123511_373478_8E3AC2D5 
X-CRM114-Status: GOOD (  14.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxNyBBcHIgMjAyMyAwOTowMTozMiBQRFQgKC0wNzAwKSwgbGludXhAd2Vpc3NzY2h1
aC5uZXQgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdl
aXNzc2NodWgubmV0Pgo+IC0tLQo+ICB0b29scy9pbmNsdWRlL25vbGliYy9hcmNoLXJpc2N2Lmgg
ICAgICAgfCA3ICsrKysrKy0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2Vm
aWxlIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJjaC1yaXNjdi5oIGIv
dG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJjaC1yaXNjdi5oCj4gaW5kZXggMGQ1ZjE1ZmRlZGM0Li5i
MmNjZmZjYzA3OWYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJjaC1yaXNj
di5oCj4gKysrIGIvdG9vbHMvaW5jbHVkZS9ub2xpYmMvYXJjaC1yaXNjdi5oCj4gQEAgLTE3Mywx
NCArMTczLDE5IEBAIHN0cnVjdCBzeXNfc3RhdF9zdHJ1Y3Qgewo+ICBjaGFyICoqZW52aXJvbiBf
X2F0dHJpYnV0ZV9fKCh3ZWFrKSk7Cj4gIGNvbnN0IHVuc2lnbmVkIGxvbmcgKl9hdXh2IF9fYXR0
cmlidXRlX18oKHdlYWspKTsKPgo+ICsjZGVmaW5lIF9fQVJDSF9TVVBQT1JUU19TVEFDS19QUk9U
RUNUT1IKPiArCj4gIC8qIHN0YXJ0dXAgY29kZSAqLwo+IC12b2lkIF9fYXR0cmlidXRlX18oKHdl
YWssbm9yZXR1cm4sb3B0aW1pemUoIm9taXQtZnJhbWUtcG9pbnRlciIpKSkgX3N0YXJ0KHZvaWQp
Cj4gK3ZvaWQgX19hdHRyaWJ1dGVfXygod2Vhayxub3JldHVybixvcHRpbWl6ZSgib21pdC1mcmFt
ZS1wb2ludGVyIiksbm9fc3RhY2tfcHJvdGVjdG9yKSkgX3N0YXJ0KHZvaWQpCj4gIHsKPiAgCV9f
YXNtX18gdm9sYXRpbGUgKAo+ICAJCSIub3B0aW9uIHB1c2hcbiIKPiAgCQkiLm9wdGlvbiBub3Jl
bGF4XG4iCj4gIAkJImxsYSAgIGdwLCBfX2dsb2JhbF9wb2ludGVyJFxuIgo+ICAJCSIub3B0aW9u
IHBvcFxuIgo+ICsjaWZkZWYgTk9MSUJDX1NUQUNLUFJPVEVDVE9SCj4gKwkJImNhbGwgX19zdGFj
a19jaGtfaW5pdFxuIiAgICAvKiBpbml0aWFsaXplIHN0YWNrIHByb3RlY3RvciAgICAgICAgICAg
ICAgICAgICAgICAgICAgKi8KPiArI2VuZGlmCj4gIAkJImx3ICAgIGEwLCAwKHNwKVxuIiAgICAg
ICAgICAvKiBhcmdjIChhMCkgd2FzIGluIHRoZSBzdGFjayAgICAgICAgICAgICAgICAgICAgICAg
ICAgKi8KPiAgCQkiYWRkICAgYTEsIHNwLCAiU1pSRUciXG4iICAgIC8qIGFyZ3YgKGExKSA9IHNw
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ICAJCSJzbGxpICBhMiwg
YTAsICJQVFJMT0ciXG4iICAgLyogZW52cCAoYTIpID0gU1pSRUcqYXJnYyAuLi4gICAgICAgICAg
ICAgICAgICAgICAgICAgICovCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L25vbGliYy9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmls
ZQo+IGluZGV4IDNjOGUzYTZmODk4NS4uMGE4M2FkMzg4YTE2IDEwMDY0NAo+IC0tLSBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQo+IEBAIC04Miw2ICs4Miw3IEBAIENGTEFHU19TVEFD
S1BST1RFQ1RPUiA9IC1ETk9MSUJDX1NUQUNLUFJPVEVDVE9SIFwKPiAgQ0ZMQUdTX1NUS1BfaTM4
NiA9ICQoQ0ZMQUdTX1NUQUNLUFJPVEVDVE9SKQo+ICBDRkxBR1NfU1RLUF94ODZfNjQgPSAkKENG
TEFHU19TVEFDS1BST1RFQ1RPUikKPiAgQ0ZMQUdTX1NUS1BfeDg2ID0gJChDRkxBR1NfU1RBQ0tQ
Uk9URUNUT1IpCj4gK0NGTEFHU19TVEtQX3Jpc2N2ID0gJChDRkxBR1NfU1RBQ0tQUk9URUNUT1Ip
Cj4gIENGTEFHU19zMzkwID0gLW02NAo+ICBDRkxBR1MgID89IC1PcyAtZm5vLWlkZW50IC1mbm8t
YXN5bmNocm9ub3VzLXVud2luZC10YWJsZXMgLXN0ZD1jODkgXAo+ICAJCSQoY2FsbCBjYy1vcHRp
b24sLWZuby1zdGFjay1wcm90ZWN0b3IpIFwKCkFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
