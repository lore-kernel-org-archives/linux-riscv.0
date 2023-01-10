Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EB3C54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 23:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6UVXrRlPkyNZ/uMzPx+HvnIy0vpT1XG/xeCV087o588=; b=GRI690rq62lBMz
	JqF47nsZ3SXJWfhy1ZQhTZ3c7u5HtTlCmyGgDI61EIW+M/W94xecJ0Ow5d89U69va6Dl7HuX/cZMx
	We1TZd7+2tBV1dk6ghMNH+d5W7mN/sTYQI/RyZRjUB1XglJhKhWuodsLovguOsu5I80MwVbgik6l8
	Njty/fZjsGyOf2BIcAkM/aH79+y9fsVEMAUv/KmYssORY50e7viPIepqfJLJZphYVRmbXNleWrEJk
	FE5aY+NrT6nCuJwzk7mKOGU2Jz/bI5D1aFqKXXI8PeY9/klDDYGsDzSPCLBJ+4mew+gJiduHQB+yH
	DTBd+acvhx9qMUWbNjTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFOIw-008w65-53; Tue, 10 Jan 2023 23:45:18 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFOIt-008w5Z-4t
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 23:45:16 +0000
Received: by mail-pg1-x536.google.com with SMTP id 36so9351263pgp.10
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 15:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D57t00k03QeMUJxkWeqB58qjl0R5qo6nYcHPSFZtf2o=;
        b=yCuhKnZBRUOZ3SYBivZpOr2OXKkUmIdRHgXeV0eTbxAWuDo4JGDjypZIPd2Gjvew5y
         cRYZLDtyrYHHwr4qNEe74IVwMZ1wo61vRtnIY4bxctJwGLBLL7E5z5esNZ7qTMM39sG2
         GvNJurftxlLcSB1/GZPLFXKpWlNM6BlaAXPvPDKIw6akF6W0unmgPrCmYyDssHHOeCgj
         GK83LS77yq0uhy8otNYIvMmHxuc1KmMpKRsgwyL1N3vsToUZsZFo48VJKt2cDJ5K17nB
         Th01JUh7jWR71yfymgMyCv5GAlczPgaBg2L7ySe7YAq7Ww8BD8lxw/UbWP4T3YEMHYCL
         l6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D57t00k03QeMUJxkWeqB58qjl0R5qo6nYcHPSFZtf2o=;
        b=WctYrs6V6FX6Kl85YLPEPCSxcqK/N83sBBE8yUMOs9EAZ/HNJYgZX3jIW6MkOhEPwJ
         HZlXeg5dEEauUJUvTi6ixFlgEqS/wUUP+5VVxaDciCpUz0EEiumM4hQMWi/K2Dks2r8h
         kDFLTyQsUdafGUpYSsNA6KzDbUWNZKqepHggqD7uvv6EEduPyn3K/j8SHIiulhGu3r4k
         4hpIMi2O1t97FydKbw3JLC7KkA4daqwez9cjy5SYB8x/4z1LOar44A8tsopKPQ2XPsHK
         PNXRrkgnfZOVBSdw9GMjmzWmd181beQZIxdQ4QNnZRbYT455FxUErau41S2VDBef8b9p
         /oQQ==
X-Gm-Message-State: AFqh2koU4zmuC3Wx9zL/rlppbSUrwyaRJjbhEd0HC3/3ntwn+hw1/FaA
	oefEIkbygC4McfUfM+4BxLmovw==
X-Google-Smtp-Source: AMrXdXvePEWyNKMCfF1uWr1aZgxVD63FQMxYzf0mZ4lZCz88XHKwgQemgZZWXUlP7JKfcudI7qBALQ==
X-Received: by 2002:a62:32c3:0:b0:580:f1b0:2211 with SMTP id y186-20020a6232c3000000b00580f1b02211mr54504306pfy.18.1673394312982;
        Tue, 10 Jan 2023 15:45:12 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id y29-20020aa793dd000000b0056c2e497b02sm8900222pff.173.2023.01.10.15.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 15:45:12 -0800 (PST)
Message-ID: <3e91a775-c671-35e8-0966-3ec9d8999e14@rivosinc.com>
Date: Tue, 10 Jan 2023 15:45:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: elf: add .riscv.attributes parsing
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux@rivosinc.com,
 kernel test robot <lkp@intel.com>
References: <20230110201841.2069353-1-vineetg@rivosinc.com>
 <01AF458D-1EDC-47D1-A902-A686E2DF26AF@jrtc27.com>
 <6dcdd143-ff1c-41f7-9f46-0c4505575669@rivosinc.com>
 <9061941F-3221-467D-B0FC-DCA8E8FF3996@jrtc27.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <9061941F-3221-467D-B0FC-DCA8E8FF3996@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_154515_449689_F547F43F 
X-CRM114-Status: GOOD (  10.09  )
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

CgpPbiAxLzEwLzIzIDE1OjIxLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPj4+IFlvdSBhbHNvIHNo
b3VsZCBoYW5kbGUgbW9yZSB0aGFuIG9uZSBzdWItc3Vic2VjdGlvbiBldmVuIGlmIHRvb2xzIGRv
buKAmXQKPj4+IGVtaXQgaXQgdG9kYXkuCj4+IEp1c3QgdG8gYmUgb24gc2FtZSBwYWdlLCBhIHN1
Yi1zZWN0aW9uIGltcGxpZXMgdGhlIGZvbGxvd2luZwo+Pgo+PiAgICAgICAgdWludDMyOmxlbiwg
TlRCUzp2ZW5kb3ItbmFtZSwgdWludDg6IFRhZ19maWxlLCB1aW50MzI6ZGF0YS1sZW4sIDx0YWc+
PHZhbHVlPi4uLi4KPj4KPj4gSWYgc28sIHRoZSBjb2RlIGRvZXMgc3VwcG9ydCBtdWx0aXBsZSBv
ZiB0aGVzZQo+IFRoYXTigJlzIGEgc3ViLXNlY3Rpb24sIGJ1dCBJIHNhaWQgc3ViLXN1YnNlY3Rp
b24uCgpUaGUgcHNBQkkgZG9jdW1lbnRhdGlvbiB0aGF0IHdlIHJldmlld2VkIHllc3RlcmRheSBv
bmx5IG1lbnRpb25zIApUYWdfRmlsZSA9IDEgYW5kIGRvZXNuJ3QgbWVudGlvbiB0aGUgdGVybSBz
dWItc3Vic2VjdGlvbiBhdCBhbGwuCldlIG5lZWQgdG8gYmUgY29uc2lzdGVudCBiZXR3ZWVuIGNv
ZGUgYW5kIHRoZSBuZXcgZG9jdW1lbnRhdGlvbiBvciBqdXN0IAphZGQgcmVmZXJlbmNlIHRvIEFS
TSBkb2N1bWVudGF0aW9uIHdoaWNoIGNvdmVycyBldmVyeXRoaW5nIGFuZCB3cml0ZSB0aGUgCmdl
bmVyYWwgcHVycG9zZSBwYXJzZXIuCgotVmluZWV0CgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
