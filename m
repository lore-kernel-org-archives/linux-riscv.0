Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4564EC4742C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 10:36:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C15A522245
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 10:36:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OV9n0KpK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsggdTMH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C15A522245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KsvfdHR7UUAzHz2RLoAkfvW5vfdBIH0tNQSmba8Ck0c=; b=OV9n0KpK2thLMAle0MCbgioFaj
	Vcy0/SWWFjR4KZiMOc3Gq/y9JmiEcqxGKXCFt8YlneHrQ8eezXATlevcDdWxvRfpCrAjuG7KEw8hB
	jfRVS3Pb1lIYJ7nfGmiLHHkpz89gidWwHyrnjb05MPoA9Kx/HwsXXp9du08I8DIob0EQ9mu8czx7W
	DWAkSqjq4RWbgrRr8lP+kdIRpGviB209E22EESLB/2uuenWKA72N4mXud82LozhyGKlcwJgqmh3jt
	lLhA84uvwPh9WgnSFu0WIsdYWXab7b24JVoBRLHdaF36MlekxIlBR8o2v0DbOO56apWhpZ8PkD8c2
	vsGXddlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdWRN-0002wx-3o; Fri, 13 Nov 2020 10:36:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdWRK-0002v8-Lv
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 10:36:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id l1so9212717wrb.9
 for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2020 02:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=jUDWeF9PyT6cRrnNxcegWdDvCpaCTEIRoEvsbbvT65I=;
 b=VsggdTMH87/nqf/cZSQ8mjFNtepxPWyhxQsW6DQyJrdtXRQg3xsJCg0wM7FM4W5DgS
 V0ybfz1ZyEM/S36HZh3MEjbQHsuoi/TSBjXH5MqKxq93Io1IyrJ7/RoAIN4cLredmxOO
 EAO2ujv/a/af75qsrozRY6ovazh6BPcP9piCa6VU0jokaPvVIg1EH+eDQcLw659ehsBd
 hjxgWtf9S7ArqSexscl2pvNzb8qche6Ne3MjcLNgMJOi9wtqwEBUrx59Kof8BaoOlv0a
 oARXAz9nmGOktXzXRY79lI8msgrDyiGE3UvGbBaJvxATsSnvF4kBcR0NwU7pIHL0e5Ho
 l4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=jUDWeF9PyT6cRrnNxcegWdDvCpaCTEIRoEvsbbvT65I=;
 b=Q3MHWaKw0eRDdd/+HcKeGLglblgOeu0gVGPoM+7J4rh6de0UAyKqPNgjIzDr89mQHn
 16xqCoLKmURKIJg5Tzstj9Br7umQFMEx0v+opb58lvC99qwYvVwtJn/asbEfo6kotMv6
 aemkP4f8srJvepYOAmmBnkMcv/7hducO2EcKAELafWI3Y13CLN6P6WbPVFblpwnTV/y+
 2BG63OE3KBuY4ZYxfG8sPmB8Pim/XEML5ukFkiClFe56P4HXMOh+KRvsnzzbLcTWffHy
 UE7O1e1fHqcUuUZkH1RHoVa2bsvWfE2IHliw+7lluO6jBgVWq600/WICQ8H9YdAe/nSC
 08MQ==
X-Gm-Message-State: AOAM530S52z01WutTUhdT9GkGKlaoT4cPqDS4fiY0xoMIiG3sN9XS3Nn
 gT86UM/AALDtgNAVe111hCX8dhKUzIhspI0zE2U=
X-Google-Smtp-Source: ABdhPJyNMtAuROf+KI61o6PimzM1V5kMK2hQvfSbOHiBVVgdPxKgWgl9QVf0tZGgLDU5KHPyJqwTpJJ7m5ofnbmPK4A=
X-Received: by 2002:adf:ed04:: with SMTP id a4mr2754898wro.172.1605263779633; 
 Fri, 13 Nov 2020 02:36:19 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Fri, 13 Nov 2020 11:36:08 +0100
Message-ID: <CAJ+HfNiQbOcqCLxFUP2FMm5QrLXUUaj852Fxe3hn_2JNiucn6g@mail.gmail.com>
Subject: csum_partial() on different archs (selftest/bpf)
To: Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_053622_770621_5DFDE8C4 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
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
Cc: Tom Herbert <tom@herbertland.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Anders Roxell <anders.roxell@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SSB3YXMgcnVubmluZyB0aGUgc2VsZnRlc3QvYnBmIG9uIHJpc2N2LCBhbmQgaGFkIGEgY2xvc2Vy
IGxvb2sgYXQgb25lCm9mIHRoZSBmYWlsaW5nIGNhc2VzOgoKICAjMTQvcCB2YWxpZCByZWFkIG1h
cCBhY2Nlc3MgaW50byBhIHJlYWQtb25seSBhcnJheSAyIEZBSUwgcmV0dmFsCjY1NTA3ICE9IC0y
OSAocnVuIDEvMSkKClRoZSB0ZXN0IGRvZXMgYSBjc3VtX3BhcnRpYWwoKSBjYWxsIHZpYSBhIEJQ
RiBoZWxwZXIuIHJpc2N2IHVzZXMgdGhlCmdlbmVyaWMgaW1wbGVtZW50YXRpb24uIGFybTY0IHVz
ZXMgdGhlIGdlbmVyaWMgY3N1bV9wYXJ0aWFsKCkgYW5kIGZhaWwKaW4gdGhlIHNhbWUgd2F5IFsx
XS4gYXJtICgzMi1iaXQpIGhhcyBhIGFyY2ggc3BlY2ZpYyBpbXBsZW1lbnRhdGlvbiwKYW5kIGZh
aWwgaW4gYW5vdGhlciB3YXkgKEZBSUwgcmV0dmFsIDEzMTA0MiAhPSAtMjkpIFsyXS4KCkkgbWlt
aWNrZWQgdGhlIHRlc3QgY2FzZSBpbiBhIHVzZXJsYW5kIHByb2dyYW0sIGNvbXBhcmluZyB0aGUg
Z2VuZXJpYwpjc3VtX3BhcnRpYWwoKSB0byB0aGUgeDg2IGltcGxlbWVudGF0aW9uIFszXSwgYW5k
IHRoZSBnZW5lcmljIGFuZCB4ODYKaW1wbGVtZW50YXRpb24gZG9lcyB5aWVsZCBhIGRpZmZlcmVu
dCByZXN1bHQuCgp4ODYgICAgIDogICAgLTI5IDogMHhmZmZmZmZlMwpnZW5lcmljIDogIDY1NTA3
IDogMHgwMDAwZmZlMwphcm0gICAgIDogMTMxMDQyIDogMHgwMDAxZmZlMgoKV2hvIGlzIGNvcnJl
Y3Q/IDotKSBJdCB3b3VsZCBiZSBuaWNlIHRvIGdldCByaWQgb2YgdGhpcyBmYWlsZWQgY2FzZS4u
LgoKClRoYW5rcywKQmrDtnJuCgoKWzFdIGh0dHBzOi8vcWEtcmVwb3J0cy5saW5hcm8ub3JnL2xr
ZnQvbGludXgtbmV4dC1tYXN0ZXIvYnVpbGQvbmV4dC0yMDIwMTExMi90ZXN0cnVuLzM0MzA0MDEv
c3VpdGUva3NlbGZ0ZXN0L3Rlc3QvYnBmLnRlc3RfdmVyaWZpZXIvbG9nClsyXSBodHRwczovL3Fh
LXJlcG9ydHMubGluYXJvLm9yZy9sa2Z0L2xpbnV4LW1haW5saW5lLW1hc3Rlci9idWlsZC92NS4x
MC1yYzMtMjA3LWc1ODVlNWIxN2I5MmQvdGVzdHJ1bi8zNDMyMzYxL3N1aXRlL2tzZWxmdGVzdC90
ZXN0L2JwZi50ZXN0X3ZlcmlmaWVyL2xvZwpbM10gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vYmpv
dG8vZGMyMmQ1OTNhYTNhYzYzYzJjOTA2MzJkZTVlZDgyZTAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
