Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6227AC88E50
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 05:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5BB2y7PlWGde1oS9VOQnUWy8k6as0oalymxtYTDyuY=; b=lqXiOcq8vMdMvt
	Oh+4IwFT9l105f2omuF/URMG5bTCAooIokNjAc9/Ggl6jXVpXApzo3sAjdtbSaIFaID38hXeiy4GV
	BD3bXe4r29i2rE5ZYR/doflAi5LOiwts2w3+lUdNf4ZeS57gjYSTgwbZ14yIJ5vstSe9QLOHI0Xu5
	5lHbVZHduXhTz3ZKK2RhsORufWZWU9+WJyB7C4ivc12MLjke0DZz3F7q5/IBU83SL/KFnWk0VIC5E
	D3yXZM67CsUb0/73sGR/27XRfCrS62gvK3hWdq7PcpjE2qMK6T3l3DUm4lG6FKCdb19IbXIyaZyYy
	O4xdDzCuNAZFbDCbv3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5z1J-00000002MEQ-0D8x;
	Mon, 14 Sep 2026 05:14:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5z1F-00000002MDf-19H8
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 05:14:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49e717c9841so8297135e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 22:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789362855; cv=none;
        d=google.com; s=arc-20260327;
        b=XqQPATK9Rjli62rfVrQCpw2WJhge9Z8DmXbbHiekg8FcT0zSj306LQM2Mxfaw36Y0k
         YgnStXqHKJwcAL1rCop36GazdlaFKfD091aDYzy9CzhS8Dmm9VVAgWpCbb0hVm7LXiFR
         TwQRCvVPZhxOTWWeQxLjXf56RSGc6i946eXmZIJi3qKu12WRcNUc7q0C6VLw2sLldV0l
         PGcoC0i/9itGO7qqXezjK4GY49BPeaJwZOLyg3qEMwRJ2B+ptbGb00UUU7N/h0PpqCQh
         A3DO6yzPx7AOGiFQBLnLzKN84ZkusiM6I+Jx9VWAKlu7NPpGs0Rkhw58p6eIXHeidiEn
         9ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1vq0Y3VWCX7lyWdlee9zNWImptkP5hflAUk9JcRAgU=;
        fh=QSxNgtpJgaXM4cdIePhH1rpqJLjRiZ9uRtKlDXKVVmo=;
        b=AEmwNUix83sIBtCEEHt5CgdjDUZTfoemdMBW8izyUZEWi8UBxrZEzGNcDG1Zs37lNO
         /GccBbCha/ugtyOoGSI7jLSd2TjRzv0COVsbGrajMQiP+rT9s1/wzocymaaTYlcpG/dU
         5Zn4jWpF36Bz55TZy2YTuWf2HpTyzPPo6AXfh6UwvSQ9rk3MTx03bVLsDQUwJ+jaBUJL
         Cq1vUK3/8KO//vrbhCJ1wCohgxCMYKnUr14Q4vgA2dUVdeMpa70SUAQT42inuJ8TKZsT
         lr2YNhNdBE7Wjpf8g7Ngb4uQb6zpDc/zb8k8vvSfr47UVzFP8QvDffBnxC1iqoCnKiWv
         FrdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789362855; x=1789967655; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1vq0Y3VWCX7lyWdlee9zNWImptkP5hflAUk9JcRAgU=;
        b=G/pIMrb+XeHa4mBrWtI/gRU3Rf6IP99oOfsIcAlSLWjoUIuh7sTo/LIct1dwQDwvKH
         o2GFetIQEaNqUzegr3FCxy1rYLKpTXeRoS8zdY1GkcP1E6xqrnNTmKoFYs8rtKl09zHG
         FzV/YTRGJjvnQizuAcYQ5z8nkd2r/LqfUOopcFw5B8qZPrzOKbp8iU2T1dwqp0fc5Yvj
         wu5fd8+28XuE6qMVXX8UHvBQ6HGxhKBYrJet7uY/fDLZLf5oHbslxp2BUudd+dUvzLAl
         drtEW+NTPzsZw2Ykp8IU24h0PC9/SNIdArYhOSQRb8h4yccxO0j3ssEweSTq5zyUjkwD
         R+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362855; x=1789967655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1vq0Y3VWCX7lyWdlee9zNWImptkP5hflAUk9JcRAgU=;
        b=UfkqZSoUoKVz9APkedIfkOIaa6Ov76ZQu6j83SHMAFLftQH2L11QBzGFOqtF8Vz3hr
         nxPgOPQ8Kx2npLRVVEGojnvJCcgt8SJQk7oIpjBab/m4LKTkFRN1Efz2RVlPMa33jfSj
         ksSp58W9PkC/e5zV9f972C/JKk4igelHlcU3jk2BBQiP7m982+OXi6OhNiJ8RUlJITMv
         uJs3rzvvGBWV46O7nex2MrMpma9Ohs+hPGIwTduo+FbAxN31KGpXkg8EgMBwrLJ5ruS9
         CFqngReOJP3gipzFOr/Rhutwk685AsUj0PVYRThPOqPKk7gM59YGNaLl3KO5gFeJLDhB
         ABfg==
X-Forwarded-Encrypted: i=1; AKwUvBz9iAHvPTecPkHwBTl4kTTjq2buiUd15A8uNK33PUVlD6gx9RE3XJlaCuGUf9jaSSO5ctm4fnSM77DbsQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nL3LJGTVoPe6ME43cqp67QSMNbs30Ws8lQ6pa42RMbh0SRX+yo
	Ot6HrCgX3lqcIyFmiKTWEC+EAZyDCpsIx2N4vQv9FYSGgmaNlfg+maLTyWdpXkcJ4ToMigfjHVm
	10kxv4Kn4/s3sXGSHKeUMELBXe5h2BGqoDfjx1EvJ2g==
X-Gm-Gg: AYBFou01JPt6WVKp6XKejCevHn4aA8TMMCxPK7uJDtzXrl3QcjLjDj1KEbZA6OPJm33
	SsYSJ3ixmkOUL9pkqlQn0HIUJhAs71ETyeVDb1OhFR5dOF95W4RCFOtNfwbxoDuoRiF/njAoylT
	hP9x7+60IOyssvJTjsB5iE3To4Dml4987RY+0/7z3lhEFlQgHwz4L2Pg9mxZKFt9Bb/jXqQlyWA
	FTsIiixw9CcqQIFbInK/ndnQZrJFHuGSZuac45dA2k+sernXGcWaX2CNKj4tV2X5jAx0nvY2MsV
	ycRO3OYTHkYKvNb9wbs/UvwNP11iq7cLGUGNEVnB279FNwhFy9SnAYEgHHlh8RU0FVMaSj4f8bT
	bkMrnBs0m0kJFzcGaxCBl5DC0U9pxFH6M+pwTh89LR01hcUCgHn4CBz4iP0VZ3BLrLOtCuLgtPA
	==
X-Received: by 2002:a05:600c:19c9:b0:49e:6e7c:d895 with SMTP id
 5b1f17b1804b1-49e7a678d7dmr8979885e9.26.1789362855198; Sun, 13 Sep 2026
 22:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260914031146.446157-1-tanchi25@mails.ucas.ac.cn>
In-Reply-To: <20260914031146.446157-1-tanchi25@mails.ucas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2026 10:44:04 +0530
X-Gm-Features: AcwNN1Xv9Q24Kz2JNPc5ElbJduPG-W_3pjLhuvmorF4ZD7AGszu1UnXv2VgFblg
Message-ID: <CAAhSdy3m8iBXiJF_=syKKm-JYpW3ou8P4FpWNB0_a-t+_dTuAg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix HSM hart status error propagation
To: Tan Chi <tanchi25@mails.ucas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_221417_333154_8EC49050 
X-CRM114-Status: GOOD (  17.48  )
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgODo0MuKAr0FNIFRhbiBDaGkgPHRhbmNoaTI1QG1haWxz
LnVjYXMuYWMuY24+IHdyb3RlOgo+Cj4ga3ZtX3NiaV9oc21fdmNwdV9nZXRfc3RhdHVzKCkgcmV0
dXJucyBTQklfRVJSX0lOVkFMSURfUEFSQU0gd2hlbgo+IHRoZSByZXF1ZXN0ZWQgaGFydCBkb2Vz
IG5vdCBleGlzdC4gSG93ZXZlciwgdGhlIEhBUlRfU1RBVFVTIGNhc2UKPiByZXR1cm5zIGZyb20g
dGhlIFNCSSBoYW5kbGVyIHdpdGhvdXQgc3RvcmluZyB0aGlzIGVycm9yIGluCj4gcmV0ZGF0YS0+
ZXJyX3ZhbC4KPgo+IEFzIGEgcmVzdWx0LCBhIGd1ZXN0IHF1ZXJ5aW5nIHRoZSBzdGF0dXMgb2Yg
YSBub24tZXhpc3RlbnQgaGFydAo+IG9ic2VydmVzIFNCSV9TVUNDRVNTIGluc3RlYWQgb2YgU0JJ
X0VSUl9JTlZBTElEX1BBUkFNLgo+Cj4gVXNlIHRoZSBjb21tb24gU0JJIGVycm9yIGhhbmRsaW5n
IHBhdGggZm9yIEhBUlRfU1RBVFVTIGFmdGVyCj4gc2F2aW5nIGEgdmFsaWQgaGFydCBzdGF0ZSBp
biByZXRkYXRhLT5vdXRfdmFsLiBUaGlzIHByZXNlcnZlcwo+IHRoZSByZXR1cm5lZCBlcnJvciB3
aGVuIGt2bV9zYmlfaHNtX3ZjcHVfZ2V0X3N0YXR1cygpIGZhaWxzLgo+Cj4gRml4ZXM6IGJhZTBk
ZmQ3NGUwMSAoIlJJU0MtVjogS1ZNOiBNb2RpZnkgU0JJIGV4dGVuc2lvbiBoYW5kbGVyIHRvIHJl
dHVybiBTQkkgZXJyb3IgY29kZSIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBBc3Np
c3RlZC1ieTogTExNCj4gU2lnbmVkLW9mZi1ieTogVGFuIENoaSA8dGFuY2hpMjVAbWFpbHMudWNh
cy5hYy5jbj4KCkdvb2QgY2F0Y2guCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGFzIGZpeCBmb3IgTGludXgtNy4zLXJjWAoK
VGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYyB8IDQg
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfaHNtLmMKPiBpbmRleCBmMjYyMDdmODRiYWIuLjA2YTE1NjI5YzI2YiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jCj4gQEAgLTk1LDkgKzk1LDkgQEAgc3RhdGljIGludCBr
dm1fc2JpX2V4dF9oc21faGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1f
cnVuICpydW4sCj4gICAgICAgICAgICAgICAgIHJldCA9IGt2bV9zYmlfaHNtX3ZjcHVfZ2V0X3N0
YXR1cyh2Y3B1KTsKPiAgICAgICAgICAgICAgICAgaWYgKHJldCA+PSAwKSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0ZGF0YS0+b3V0X3ZhbCA9IHJldDsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICByZXRkYXRhLT5lcnJfdmFsID0gMDsKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXQgPSAwOwo+ICAgICAgICAgICAgICAgICB9Cj4gLSAgICAgICAgICAgICAgIHJldHVybiAwOwo+
ICsgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgU0JJX0VYVF9IU01fSEFSVF9T
VVNQRU5EOgo+ICAgICAgICAgICAgICAgICBzd2l0Y2ggKGxvd2VyXzMyX2JpdHMoY3AtPmEwKSkg
ewo+ICAgICAgICAgICAgICAgICBjYXNlIFNCSV9IU01fU1VTUEVORF9SRVRfREVGQVVMVDoKPgo+
IGJhc2UtY29tbWl0OiBkZjI5MDgwOTBjZGEzNjhiMDFmZjQzNzA5ZjUxODkwMDc2YzU2MTU3Cj4g
LS0KPiAyLjUzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
