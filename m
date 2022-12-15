Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D123C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 19:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfcltcRvFb42z+8KMxlhYDgMMW5nQ2snIOvsS9q6HrY=; b=LOM1MKjooVbhn9
	6i5xwCkpNnQyvWM7dHDKYLtUib37E7XXUSOsa0248fR64e0bkY+oZGrtoQQnXKp49i98wXNucXmPv
	Ru3qtLjCz7DvIEB6iLMcTAolEgYHm6PwUKGiS1NOHBrp7WRQDxRoLD4EZm8dDf3Wg1D3EtlrEyko8
	zuUIuonibiVQvQJiQyXz3CRpWn3rZpzh2VRSXhnDwd8l5ErlDJeu28+x6quEtZ08rJqlBqHk1W8Cq
	MV3xO2FuGKrRBCc/4SLVbxpEvtg3Sblsnn0x8lvsN/XCu8hPfII3ZE0oV1V+kaDW+FE293aMhkLok
	UmWOZwQqaEGB0euqbHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5uL4-00B9Dg-Fw; Thu, 15 Dec 2022 19:56:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5uL2-00B9D3-1w
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 19:56:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id s7so102933plk.5
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 11:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=it0uTRBQhUXDracpaZxA5Z7G29uVq/1PiUNU//RAySE=;
        b=LeUibo5bBRVt9ARvHtnOzL8dVYOmkno+cXXhc8T9DGWnTtVq4uo3scjYpgTfG5ZZZf
         PmxQNmQQ0XTPF6MNXh4pYdHI400ISfgkAfc7pTj5cLsBDUR5nhpNPKDZRr7VdpbK0O2A
         wqfukHETveeeWyb3yUTQag7RQ/lo3X93LVksk6Qitd/KuIzmEt5CPWWshugflKYneENG
         EepsGWVPtd27YsuuBCsDnxAydFwcfktBhmI1Yxrx7ExrzLMX6YulPeIWjKY1D1pHDxyX
         TCZPIr0QvlffQqRoATrQxulIn3rFFPTc27c5DEuwNQfpJTvB9EBwa7tHxautBdVex/Re
         J6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=it0uTRBQhUXDracpaZxA5Z7G29uVq/1PiUNU//RAySE=;
        b=dbKyexOWu1guYTgGi0tAPsSG8HGywzJR0EB0s8YwsbPwNveVpuZzQQQQWItx0tZjFD
         gRSfXNxUA1wWVIvNDLfQLRtb+MAftE8/DTGSEVXUo3TnZnFYKgHL/ZxbTD/+FxLdnKqI
         R+U/81/WhqXeaPCkTyzZVwn6qY7+hByVoBpuCLHDw8QlvTnEpzwp6+RpgwA0tV+OuJM9
         +prPT1gv/hEmE8WorXc/Mw8wSrKVA7kbRs4uiIkSPWQKxwZQatnhSNNtpzzuztlxqLZ/
         E3Wu/v14WO5rNN+Xk8OG3Oxx7OyI6Y+eHE9oeFJXxqkERAqnN+E8Z3bC4T80OKPgG/4o
         IR3Q==
X-Gm-Message-State: ANoB5plCLZy0bYtNZCtW549juDyGvjjmhEK0GemWEFbMh0Y6orkSfZuX
	XpR53MDv/i7b2HW/Rh7iVQUBgnrb2FUBXiHp
X-Google-Smtp-Source: AA0mqf6LDsbWUosYATxNBqxNJIgG35kSDFZiFI0WxSYWYNDRcvMizdUBYVJf30FbwMW6NQPmjtfQSQ==
X-Received: by 2002:a17:902:b708:b0:189:9dca:65e1 with SMTP id d8-20020a170902b70800b001899dca65e1mr26955860pls.21.1671134175155;
        Thu, 15 Dec 2022 11:56:15 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a80f:54a1:edc3:6cb4? ([2602:47:d48c:8101:a80f:54a1:edc3:6cb4])
        by smtp.gmail.com with ESMTPSA id f15-20020a170902684f00b00182d25a1e4bsm7816pln.259.2022.12.15.11.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 11:56:14 -0800 (PST)
Message-ID: <37dbef55-fd78-91db-33fb-ca1691fe1cc6@linaro.org>
Date: Thu, 15 Dec 2022 11:56:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
Content-Language: en-US
To: Vineet Gupta <vineetg@rivosinc.com>, Florian Weimer <fweimer@redhat.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Darius Rad <darius@bluespec.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Waterman <andrew@sifive.com>, stillson@rivosinc.com,
 Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
 atishp@atishpatra.org, guoren@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
 vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 libc-alpha@sourceware.org, christoph.muellner@vrull.eu,
 Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
 <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
 <Y5irn63DQkwumfvW@bruce.bluespec.com>
 <8fe9cfaf-2cbc-8de6-3928-067de9113bfc@rivosinc.com>
 <Y5qByfCtpV0uNID3@bruce.bluespec.com>
 <877cysx4yf.fsf@all.your.base.are.belong.to.us>
 <87h6xwdf5g.fsf@oldenburg.str.redhat.com>
 <24a1a812-95a9-ed97-abd1-c0ff259726d2@linaro.org>
 <15d902d0-4492-f828-7147-164319d741f9@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <15d902d0-4492-f828-7147-164319d741f9@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_115616_133372_E5AC0957 
X-CRM114-Status: UNSURE (   9.77  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMTUvMjIgMTA6NTcsIFZpbmVldCBHdXB0YSB3cm90ZToKPj4gVGhlIG90aGVyIHRoaW5n
IG9mIG5vdGUgZm9yIFNWRSBpcyB0aGF0LCB3aXRoIHRoZSBkZWZhdWx0IGZ1bmN0aW9uIEFCSSBh
bGwgb2YgdGhlIFNWRSAKPj4gc3RhdGUgaXMgY2FsbC1jbG9iYmVyZWQsIHdoaWNoIGFsbG93cyB0
aGUga2VybmVsIHRvIGRyb3AgaW5zdGVhZCBvZiBzYXZlIHN0YXRlIGFjcm9zcyAKPj4gc3lzdGVt
IGNhbGxzLsKgIChUaGVyZSBpcyBhIHNlcGFyYXRlIHZlY3RvciBmdW5jdGlvbiBjYWxsIEFCSSB3
aGVuIFNWRSB0eXBlcyBhcmUgdXNlZC4pCj4gCj4gRm9yIHRoZSBSViBwc0FCSSwgaXQgaXMgc2lt
aWxhciAtIGFsbCBWIHJlZ3MgYXJlIGNhbGxlci1zYXZlZC9jYWxsLWNsb2JiZXJlZCBbMV0gYW5k
IAo+IHN5c2NhbGxzIGFyZSBub3QgcmVxdWlyZWQgdG8gcHJlc2VydmUgViByZWdzIFsyXQo+IEhv
d2V2ZXIgbGFzdCBJIGNoZWNrZWQgQVJNIGRvY3VtZW50YXRpb24gdGhlIEFCSSBkb2Mgc2VlbWVk
IHRvIHN1Z2dlc3QgdGhhdCBzb21lIChwYXJ0cykgCj4gb2YgdGhlIFNWRSByZWdzIGFyZSBjYWxs
ZWUtc2F2ZWQgWzNdCgpBcyBQaW5za2kgbWVudGlvbmVkLCBqdXN0IHNvbWUgbG93IGJpdHMgdGhh
dCBvdmVybGFwIHdpdGggc2NhbGFyIGZwIHN0YXRlOyB0aGUgaGlnaCBiaXRzIAphbmQgdGhlIHBy
ZWRpY2F0ZSByZWdpc3RlcnMgZ2V0cyB6ZXJvZWQgd2hlbiByZS1lbmFibGluZy4KCgo+PiBTbyB3
aGlsZSBzdHJjcHkgbWF5IGVuYWJsZSBTVkUgZm9yIHRoZSB0aHJlYWQsIHRoZSBuZXh0IHN5c2Nh
bGwgbWF5IGRpc2FibGUgaXQgYWdhaW4uCj4gCj4gTmV4dCBzeXNjYWxsIGNvdWxkIHRyYXNoIHRo
ZW0sIGJ1dCB3aWxsIGl0IGRpc2FibGUgU1ZFID8KClllcy4gIFNlZSBmcF91c2VyX2Rpc2NhcmQo
KSBpbiBhcmNoL2FybTY0L2tlcm5lbC9zeXNjYWxsLmMuCgoKcn4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
