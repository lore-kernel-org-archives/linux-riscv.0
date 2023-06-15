Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83458EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6a81pdMNMYBePHf1n/fYrRwRadZ8LLmIrDoNJYnTos=; b=RT+NBlu9PDRdKu
	iMxPK8/OXyAnF+SGL/HvG9mOwLzzRIcYsSji7v1TjXuyWbVTR/nJVGbjXuXkm1F+2PuboyofUN0Yv
	y8DLQIV33Yac+jpE7doWrqlXlfXZMTBYaQ5ptpGNrXjE4PlN/cqC665fSXEyf7NY3FFgzxnNruZjT
	C96mHIqoLa5/iPegk4oKGlqUX4r6ilTa/u8FO9TSuWsMDfveLqkhE/Kbtsn4JMzGOfLnfy7KqePw5
	B+JwjBzb9DEDQrQkAiv2tG6cLu4DEVilH6Q7pqJOHKvWgIhlJ3GIaYRjoq9Y9hZr0xD6dydJoiof2
	emugZpKTXYhOIVODHEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9u6g-00G5kh-2z;
	Thu, 15 Jun 2023 21:02:14 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9u6e-00G5jK-0M
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 21:02:13 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6237faa8677so1126596d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 14:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686862927; x=1689454927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gM071qijEG6vwQ8W2iWjOXAWrKZk2GbsTR59ysMJ+f0=;
        b=r3+18zMpdGu3FBIH/XR/CeWPIdLuk9aHwOyPzPMPD+aHBmCQpHV+CqHUcVxkyh3f56
         fQ7+hwVRMsFfVJ6+fAgFxywc9Ey5lBpqCJ1GP/M6gvUqaPeqlGn+b+LTUfV+eWSTjehP
         AttQBBokUk9dBF//9b4mMJFpP/2IYaDEkFoGTV/xU2CUd5Kss+CHXPeuI2SnlPARzQjV
         627F9+EcbOVoZxCvs6FMh/M6bErKb9BknEk6bpMOEacDUXg9U3FvnUNrB1OD8WsQ5mpN
         ftALbqUPSTzgQw4ZxwDtP2xWijGeHdmJZRHt9ceN4vbAImdo/Irw3ryRWU7EZjVnA/Lw
         osEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686862927; x=1689454927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gM071qijEG6vwQ8W2iWjOXAWrKZk2GbsTR59ysMJ+f0=;
        b=OFh2P72XbR75FsNUWf5OUkTlcs+T9Jh/yQvyhyrYYD/+6+Pa0ZsvR63wLmz29BN6B4
         65ktxgcpXnWsrWStBr1dOI/1RlCFsXc15hrZIzlKSsQsMpWH51cXlqYwwKM4GhRnquWJ
         TJbRL7lQUI7B8aeXetUJymWj6cbS+3siBJodfUXh1CP3vqfkSJyykou+WbbXc0sLLNGF
         VFOz5eXNbB11YamA2aay00bpX3R2Eh+OF2a1FI+TYv9FlnVqf1W3XjacOtpgFKVs0r9k
         2fSOjefnLZm/IwlLpazsva2ML0wLKwsN+ykt81wLze5zL8id09u3Xb4/X5G3gY9EydUX
         KC3Q==
X-Gm-Message-State: AC+VfDyYNarVBog4KVzkFwv4QJchiyxxKzndSVTmTRc6ICC2Y3hfhPLT
	sJPWYWMOdMgSJXZQljQ00Hvt3KDPPoCYWMWmLJn3ow==
X-Google-Smtp-Source: ACHHUZ4krPXQb/OSjDusqHVygPJ8Ls9dUMXR5x901QOHwbeTZhZdMqBueLHq0YUPgxe/cr08Jcvy1LCoC+5/N/PO2+Y=
X-Received: by 2002:ad4:5d62:0:b0:62f:f23e:14fe with SMTP id
 fn2-20020ad45d62000000b0062ff23e14femr102715qvb.20.1686862927549; Thu, 15 Jun
 2023 14:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230614-kselftest-mm-llvm-v1-1-180523f277d3@kernel.org>
In-Reply-To: <20230614-kselftest-mm-llvm-v1-1-180523f277d3@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Jun 2023 17:01:56 -0400
Message-ID: <CAKwvOdk0sPi95TSdbyEKXud68nHq_7=ccDwaCkVsyd54ArRC=A@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: Fix cross compilation with LLVM
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_140212_152576_BA218BDC 
X-CRM114-Status: GOOD (  23.09  )
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgNToxOeKAr1BNIE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBDdXJyZW50bHkgdGhlIE1NIHNlbGZ0ZXN0cyBhdHRlbXB0IHRv
IHdvcmsgb3V0IHRoZSB0YXJnZXQgYXJjaGl0ZWN0dXJlIGJ5Cj4gdXNpbmcgQ1JPU1NfQ09NUElM
RSBvciBvdGhlcndpc2UgcXVlcnlpbmcgdGhlIGhvc3QgbWFjaGluZSwgc3RvcmluZyB0aGUKPiB0
YXJnZXQgYXJjaGl0ZWN0dXJlIGluIGEgdmFyaWFibGUgY2FsbGVkIE1BQ0hJTkUgcmF0aGVyIHRo
YW4gdGhlIHVzdWFsIEFSQ0gKPiB0aG91Z2ggYXMgZmFyIGFzIEkgY2FuIHRlbGwgKGluY2x1ZGlu
ZyBmb3IgeDg2XzY0KSB0aGUgdmFsdWUgaXMgdGhlIHNhbWUgYXMKPiB3ZSB3b3VsZCB1c2UgZm9y
IGFyY2hpdGVjdHVyZS4KPgo+IFdoZW4gY3Jvc3MgY29tcGlsaW5nIHdpdGggTExWTSB3ZSBkb24n
dCBuZWVkIGEgQ1JPU1NfQ09NUElMRSBhcyBMTFZNIGNhbgo+IHN1cHBvcnQgbWFueSB0YXJnZXQg
YXJjaGl0ZWN0dXJlcyBpbiBhIHNpbmdsZSBidWlsZCBzbyB0aGlzIGxvZ2ljIGRvZXMgbm90Cj4g
d29yaywgQ1JPU1NfQ09NUElMRSBpcyBub3Qgc2V0IGFuZCB3ZSBlbmQgdXAgc2VsZWN0aW5nIHRl
c3RzIGZvciB0aGUgaG9zdAo+IHJhdGhlciB0aGFuIHRhcmdldCBhcmNoaXRlY3R1cmUuIEZpeCB0
aGlzIGJ5IHVzaW5nIHRoZSBtb3JlIHN0YW5kYXJkIEFSQ0gKPiB0byBkZXNjcmliZSB0aGUgYXJj
aGl0ZWN0dXJlLCB0YWtpbmcgaXQgZnJvbSB0aGUgZW52aXJvbm1lbnQgaWYgc3BlY2lmaWVkLgo+
Cj4gU2lnbmVkLW9mZi1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgoKQnJvb25p
ZSwKVGhhbmtzIGZvciB0aGUgcGF0Y2ghIFdoYXQncyB0aGUgYmVzdCB3YXkgdG8gdGVzdCB0aGlz
PwoKJCBBUkNIPWFybTY0IG1ha2UgTExWTT0xIC1qMTI4IC1DIHRvb2xzL3Rlc3Rpbmcvc2VsZnRl
CnN0cy9tbS8KCklzIHdoYXQgSSB3b3VsZCBoYXZlIGd1ZXNzZWQsIGJ1dCBJIGdldCBlcnJvcnMg
d2l0aCBvciB3aXRob3V0IHRoaXMgcGF0Y2guCgpBbHNvLCBmd2l3LCBiNCBzaG93cyB0aGF0IHlv
dSBkb24ndCBoYXZlIGEgcGdwIGtleSBzZXR1cCBmb3IKYnJvb25pZUBrZXJuZWwub3JnOyBJIGRv
bid0IHRoaW5rIGl0IG1hdHRlcnMsIGJ1dCBtYXliZSBpdCdzIGEKc3VycHJpc2UgdG8geW91IGlm
IHlvdSB0aG91Z2h0IHlvdSBoYWQgc2V0IHRoYXQgdXAsCiQgYjQgc2hhemFtIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xsdm0vMjAyMzA2MTQta3NlbGZ0ZXN0LW1tLWxsdm0tdjEtMS0xODA1MjNm
Mjc3ZDNAa2VybmVsLm9yZy8KLi4uCiAg4pyXIE5vIGtleTogb3BlbnBncC9icm9vbmllQGtlcm5l
bC5vcmcKCgo+IC0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tbS9NYWtlZmlsZSB8IDEz
ICsrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tbS9NYWtl
ZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21tL01ha2VmaWxlCj4gaW5kZXggMjNhZjQ2
MzNmMGY0Li40ZjBjNTBjMzNiYTcgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvbW0vTWFrZWZpbGUKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tbS9NYWtlZmls
ZQo+IEBAIC01LDEyICs1LDE1IEBAIExPQ0FMX0hEUlMgKz0gJChzZWxmZGlyKS9tbS9sb2NhbF9j
b25maWcuaCAkKHRvcF9zcmNkaXIpL21tL2d1cF90ZXN0LmgKPgo+ICBpbmNsdWRlIGxvY2FsX2Nv
bmZpZy5tawo+Cj4gK2lmZXEgKCQoQVJDSCksKQo+ICsKPiAgaWZlcSAoJChDUk9TU19DT01QSUxF
KSwpCj4gIHVuYW1lX00gOj0gJChzaGVsbCB1bmFtZSAtbSAyPi9kZXYvbnVsbCB8fCBlY2hvIG5v
dCkKPiAgZWxzZQo+ICB1bmFtZV9NIDo9ICQoc2hlbGwgZWNobyAkKENST1NTX0NPTVBJTEUpIHwg
Z3JlcCAtbyAnXlthLXowLTldXCsnKQo+ICBlbmRpZgo+IC1NQUNISU5FID89ICQoc2hlbGwgZWNo
byAkKHVuYW1lX00pIHwgc2VkIC1lICdzL2FhcmNoNjQuKi9hcm02NC8nIC1lICdzL3BwYzY0Liov
cHBjNjQvJykKPiArQVJDSCA/PSAkKHNoZWxsIGVjaG8gJCh1bmFtZV9NKSB8IHNlZCAtZSAncy9h
YXJjaDY0LiovYXJtNjQvJyAtZSAncy9wcGM2NC4qL3BwYzY0LycpCj4gK2VuZGlmCj4KPiAgIyBX
aXRob3V0IHRoaXMsIGZhaWxlZCBidWlsZCBwcm9kdWN0cyByZW1haW4sIHdpdGggdXAtdG8tZGF0
ZSB0aW1lc3RhbXBzLAo+ICAjIHRodXMgdHJpY2tpbmcgTWFrZSAoYW5kIHlvdSEpIGludG8gYmVs
aWV2aW5nIHRoYXQgQWxsIElzIFdlbGwsIGluIHN1YnNlcXVlbnQKPiBAQCAtNjUsNyArNjgsNyBA
QCBURVNUX0dFTl9QUk9HUyArPSBrc21fdGVzdHMKPiAgVEVTVF9HRU5fUFJPR1MgKz0ga3NtX2Z1
bmN0aW9uYWxfdGVzdHMKPiAgVEVTVF9HRU5fUFJPR1MgKz0gbWR3ZV90ZXN0Cj4KPiAtaWZlcSAo
JChNQUNISU5FKSx4ODZfNjQpCj4gK2lmZXEgKCQoQVJDSCkseDg2XzY0KQo+ICBDQU5fQlVJTERf
STM4NiA6PSAkKHNoZWxsIC4vLi4veDg2L2NoZWNrX2NjLnNoICIkKENDKSIgLi4veDg2L3RyaXZp
YWxfMzJiaXRfcHJvZ3JhbS5jIC1tMzIpCj4gIENBTl9CVUlMRF9YODZfNjQgOj0gJChzaGVsbCAu
Ly4uL3g4Ni9jaGVja19jYy5zaCAiJChDQykiIC4uL3g4Ni90cml2aWFsXzY0Yml0X3Byb2dyYW0u
YykKPiAgQ0FOX0JVSUxEX1dJVEhfTk9QSUUgOj0gJChzaGVsbCAuLy4uL3g4Ni9jaGVja19jYy5z
aCAiJChDQykiIC4uL3g4Ni90cml2aWFsX3Byb2dyYW0uYyAtbm8tcGllKQo+IEBAIC04NywxMyAr
OTAsMTMgQEAgVEVTVF9HRU5fUFJPR1MgKz0gJChCSU5BUklFU182NCkKPiAgZW5kaWYKPiAgZWxz
ZQo+Cj4gLWlmbmVxICgsJChmaW5kc3RyaW5nICQoTUFDSElORSkscHBjNjQpKQo+ICtpZm5lcSAo
LCQoZmluZHN0cmluZyAkKEFSQ0gpLHBwYzY0KSkKPiAgVEVTVF9HRU5fUFJPR1MgKz0gcHJvdGVj
dGlvbl9rZXlzCj4gIGVuZGlmCj4KPiAgZW5kaWYKPgo+IC1pZm5lcSAoLCQoZmlsdGVyICQoTUFD
SElORSksYXJtNjQgaWE2NCBtaXBzNjQgcGFyaXNjNjQgcHBjNjQgcmlzY3Y2NCBzMzkweCBzcGFy
YzY0IHg4Nl82NCkpCj4gK2lmbmVxICgsJChmaWx0ZXIgJChBUkNIKSxhcm02NCBpYTY0IG1pcHM2
NCBwYXJpc2M2NCBwcGM2NCByaXNjdjY0IHMzOTB4IHNwYXJjNjQgeDg2XzY0KSkKPiAgVEVTVF9H
RU5fUFJPR1MgKz0gdmFfaGlnaF9hZGRyX3N3aXRjaAo+ICBURVNUX0dFTl9QUk9HUyArPSB2aXJ0
dWFsX2FkZHJlc3NfcmFuZ2UKPiAgVEVTVF9HRU5fUFJPR1MgKz0gd3JpdGVfdG9faHVnZXRsYmZz
Cj4gQEAgLTExMiw3ICsxMTUsNyBAQCAkKFRFU1RfR0VOX1BST0dTKTogdm1fdXRpbC5jCj4gICQo
T1VUUFVUKS91ZmZkLXN0cmVzczogdWZmZC1jb21tb24uYwo+ICAkKE9VVFBVVCkvdWZmZC11bml0
LXRlc3RzOiB1ZmZkLWNvbW1vbi5jCj4KPiAtaWZlcSAoJChNQUNISU5FKSx4ODZfNjQpCj4gK2lm
ZXEgKCQoQVJDSCkseDg2XzY0KQo+ICBCSU5BUklFU18zMiA6PSAkKHBhdHN1YnN0ICUsJChPVVRQ
VVQpLyUsJChCSU5BUklFU18zMikpCj4gIEJJTkFSSUVTXzY0IDo9ICQocGF0c3Vic3QgJSwkKE9V
VFBVVCkvJSwkKEJJTkFSSUVTXzY0KSkKPgo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IDg1OGZkMTY4
YTk1YzViOTY2OWFhYzhkYjZjMTRhOWFlYWI0NDYzNzUKPiBjaGFuZ2UtaWQ6IDIwMjMwNjE0LWtz
ZWxmdGVzdC1tbS1sbHZtLWEyNWE3ZGFmZmE2Zgo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gTWFy
ayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+Cj4KCgotLSAKVGhhbmtzLAp+TmljayBEZXNh
dWxuaWVycwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
