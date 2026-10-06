Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FA5CA5FFC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PLLEIrzno3ZSIYf4nqVUqztgqFk3zFtXvGKx7K1hzM=; b=CnpkTnkv72WLNZ
	8GVFAz48NWp9FeNOkXvzk0isPTzDhhthKyyfj8KK7eR8dOwqkF2f/J62BIdzEDWPnSZzxHq3p12po
	EXH/JeRXyprx5BSyK/jVVqgAI2jicfT0URz4HkxkwmWqtSbu+j1GibpKkGGMC3+qOPdLjDfyjWcDI
	i08GKdK3fNIjTiidCos5IeIy5wOgBgWIbGK9B5nCFJD6GqusfAK/CqwmVx+5RVZ9aGdmHwVmUjWEi
	TgSzUI1djg+yBFS1GgZQg6rjNmFMV+lK62n/mqMX+7Q3bjcMmtSviercjd0ou+gMzF/wQ21h4UkoC
	oN5Ccg+4HkAPfCobjEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6qH-000000010ml-3Uhi;
	Tue, 06 Oct 2026 15:12:33 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6qD-000000010lc-0nEv
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 15:12:32 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8ac4806e210so9427827b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 08:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299548; cv=none;
        d=google.com; s=arc-20260327;
        b=oeZ2MC7+hs5Qg1OBJQJK2+bFTQ9/uI7tb0XWXF64hFnApMb6gufjYOWDw27c6jX5mj
         QovRQ7182lz/wcoIsCMgpEfwRbeHplmanv9yt9wOAYZsXRSC8S8w+QfogulWKcRK3KLY
         OoHMb+f2wvfWqh7M0RE8ycJAEzQJHQMhURT1DTf1i0YqtUeSfgQ1QWpqn/PITuD0Z2YY
         LnQX/KGdCc6TV0XrlmQ2AT1EBt3v0MDCQrr017UL52unfMgtXivzbKtfsWIAhOTebWQ2
         C5nfsi1T3lY16AkD+u0CI6AJdKysF4/bPb6T2bPbwCw8/46TxvNaTi4AifpM21HCXU4j
         uxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mtMVlOhfl7dVywIUmoTG/iwD9ZKg/EsOsz1i8lgIOSU=;
        fh=a3AZF04h/wFWn/gr8i/TRuWee1n63edGty5tr5hRbvI=;
        b=eXA9EPYD1O4EOqx2dsEfCw521QJUMTsvZrY7ULm3iQ+4YlFuyDU8MP4duiIyln5LqZ
         KX+bHJIgxYCbsgp2OO24nZay3uYzBSH2Wk/X+s2i12Ip1nsR+21P2jvbj3Hx7ZpJNWOj
         Hx+HwOqI5fk6CnJRyT/vKdEIpKivEuuctJNcDzdOgr3p5HPB6sijpfgwuoumi0MuG1Io
         sHHR69Rq0kAJR6leqMv0nVJTi+JTQCYJ4ckkppE4oCW7MWpgtZoZ/AO8k6Ru672XcM/i
         jm/v2aWnJwEVHQLxAO7DiTrg1Gpvd6REutT/YBeeyuI7j6IsVFZBLSLyluhH+be1BR9p
         8uZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791299548; x=1791904348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mtMVlOhfl7dVywIUmoTG/iwD9ZKg/EsOsz1i8lgIOSU=;
        b=PP5Iph8YRRjp8kd4VZrbA+DUJa7YhxK2b6eSeJCJB//qHcdQigHd8zhj6s99qN4jmW
         pEjsi6xx2i/fxqaM0C0myP7thHFz9jX0aB74+t2ywObgHxlkkz3ic7IyLsrjAig9XusK
         a+lsDzZFBoqcsJVngiQQszwKk2FGlPyzHeriH7fd6yabt5tNxwJNHEFmUfSzmv18ODWu
         nW6BDzf2AW+8BF8nLCQjTH0nXNg5X5P9dD3M9df6nE90naaHCHl4gxOvj9k/rzHdnxR5
         ynbr1ZHK0N81JraQn0e3FALlW9eY/mMt279wfbSdJw3wHcg1Pac99DBnVviCo6owVNtw
         Y5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299548; x=1791904348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtMVlOhfl7dVywIUmoTG/iwD9ZKg/EsOsz1i8lgIOSU=;
        b=s2I38/xkVLu7kQ36shDPg5vvM/gA+6Dex2RHWFcoMGQbRODwvGIduvHdozPrljX3En
         vO/D9S6gYisp8uIHM3nGdncdHBwrT/s/zV0JQMCC2h2ITzrcKnKUGuYtHcTk5sRkjJQW
         MEUEFwN5fNPzckLCLAFNhwVmn1dMNEld+Qe1J+9K5b4WgpjwmxH43gMRQdNZCD/h5y/h
         T27pOhd66NDLUENN4GXDBu9PQCwtclcJnTePVoQTHEuO8vOqUyy6hX059hdOPLwexYat
         kL0tT35ch0kWlsCjJKZbaPpGxPA3gKKye7bAczoSEfqmFk2N0z+meiXYgXeRftnw8KhA
         iz1w==
X-Forwarded-Encrypted: i=1; AKwUvBxWl9QB3AHQmUpL40mnmPy67R7eCORTQTpBMJ7iz6EqvxAoh7EUK+dRoSQFvPxQY1OPrwW81p9FTKzcVg==@lists.infradead.org
X-Gm-Message-State: AFq9FYK9u2GfT1+s041skTCOowc79mg5JU00gz6B82hOpJMiTEDJgeX8
	SOuDGH51LKByY4/8IGTPaYJxEBgylZ3Wv2BQhGpny1wIz7NnIAK8wnoPCkAK4qsRxpmnvqIRoJV
	fVQgB+L9P9Eae22eTCWW5Ka0QD6q4o+qnurq+Cu4n0Q==
X-Gm-Gg: AYBFou0BFGoYoAIhvkfa2NLhp6/hsrbN9/8t3SNjl9VdR50SLFCHp734DAl+S5Xwzzi
	h/g742/VkeevIOPqcaAdSvYAhJ7htjvM5pS1hzuUzGKHKyX22VieerX+zDr+Cn2I0NlyAg3iObq
	k5q65GDe6Kuir9fctWOgkoa4pqLFueQl0rLjD1uFZ3p2pk7k/k7Ymg+FugPdj4wXZatM8erBqSD
	dD6Bgvqjw3abYPclJo6F8ZLNM/5PXEI5p5gHFiixY9D02w++maVRjn+uJulKnJ8Tg1mV9LjM13K
	ICkvsGm7VnJ9O3jveVzqjruwEyttBIWo3WiOb94MgtXWASXgHODAOtRXWeJqMS1JLX78U4RSK8A
	8UZi8PjYw4RVCJSAAt+pQ
X-Received: by 2002:a05:690c:85:b0:883:768:7432 with SMTP id
 00721157ae682-8b04f441f91mr9459587b3.49.1791299547459; Tue, 06 Oct 2026
 08:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk> <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
 <asSb3RNcityVg6ia@lore-desk> <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
 <asUGoxyJWVcsYBWG@lore-desk>
In-Reply-To: <asUGoxyJWVcsYBWG@lore-desk>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 6 Oct 2026 10:12:16 -0500
X-Gm-Features: AclHuK-RCm43_jlNT_lFUhdrwLSuRNyZQs6NCda3layOtVwA4kmc3GhgcBuqpZ4
Message-ID: <CAEev2e_+Dcj60Rj2+_UD=3_kNQxLK4rmWTGK-dr-Ve9mGJBARg@mail.gmail.com>
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_081231_185469_53407ADF 
X-CRM114-Status: GOOD (  32.28  )
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

SGVsbyBMb3JlbnpvLAoKT24gVHVlLCBPY3QgNiwgMjAyNiBhdCA5OjMz4oCvQU0gTG9yZW56byBC
aWFuY29uaQo8bG9yZW56by5iaWFuY29uaUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9u
IE9jdCAwNiwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+ID4gSGkgTG9yZW56bywKPiA+Cj4g
PiBPbiBUdWUsIE9jdCA2LCAyMDI2IGF0IDE6NTfigK9BTSBMb3JlbnpvIEJpYW5jb25pCj4gPiA8
bG9yZW56by5iaWFuY29uaUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gPiBI
aSBMb3JlbnpvLAo+ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCBPY3QgNSwgMjAyNiBhdCA0OjUz4oCv
UE0gTG9yZW56byBCaWFuY29uaQo+ID4gPiA+IDxsb3JlbnpvLmJpYW5jb25pQG9zcy5xdWFsY29t
bS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gVHVlLCBTZXAgMjksIDIwMjYg
YXQgMDM6MTA6MTFQTSArMDIwMCwgTG9yZW56byBCaWFuY29uaSB3cm90ZToKPiA+ID4gPiA+ID4g
PiBzdG1tYWNfdXBkYXRlX3N1YnNlY29uZF9pbmNyZW1lbnQoKSBpZ25vcmVzIHRoZSBlcnJvciBy
ZXR1cm5lZCBieQo+ID4gPiA+ID4gPiA+IHN0bW1hY19jb25maWdfYWRkZW5kKCksIGFuZCBzdG1t
YWNfaW5pdF90c3RhbXBfY291bnRlcigpIGRpc2NhcmRzIHRoZQo+ID4gPiA+ID4gPiA+IGFkZGVu
ZCBhbmQgc3lzdGVtIHRpbWUgcHJvZ3JhbW1pbmcgZXJyb3JzLCBhbHdheXMgcmV0dXJuaW5nIHN1
Y2Nlc3MuIEEKPiA+ID4gPiA+ID4gPiBmYWlsdXJlIHRvIHByb2dyYW0gdGhlIGFkZGVuZCAoUFRQ
X1RDUl9UU0FERFJFRykgb3IgdG8gaW5pdGlhbGl6ZSB0aGUKPiA+ID4gPiA+ID4gPiBzeXN0ZW0g
dGltZSBjb3VudGVyIChQVFBfVENSX1RTSU5JVCkgaXMgdGhlcmVmb3JlIHNpbGVudGx5IHN3YWxs
b3dlZCwKPiA+ID4gPiA+ID4gPiBsZWF2aW5nIHRoZSBoYXJkd2FyZSB0aW1lc3RhbXAgY291bnRl
ciBpbiBhIG5vbi1ydW5uaW5nIG9yIHBhcnRpYWxseQo+ID4gPiA+ID4gPiA+IGNvbmZpZ3VyZWQg
c3RhdGUgd2hpbGUgdGhlIGRyaXZlciBrZWVwcyBvcGVyYXRpbmcgYXMgaWYgdGltZXN0YW1waW5n
Cj4gPiA+ID4gPiA+ID4gd2VyZSB1cC4gVGhpcyBtYXR0ZXJzIGZvciBUQVBSSU8vRVNUIG9mZmxv
YWRpbmcsIHdoaWNoIGRlcml2ZXMgdGhlIGdhdGUKPiA+ID4gPiA+ID4gPiBiYXNlIHRpbWUgZnJv
bSB0aGUgaGFyZHdhcmUgdGltZXN0YW1wIGNvdW50ZXIuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiBUaGUgc2FtZSBob29rcyBhcmUgYWxzbyBjYWxsZWQgZnJvbSB0aGUgUEhDIGNhbGxiYWNr
czogc2V0dGltZTY0IGFuZAo+ID4gPiA+ID4gPiA+IGFkamZpbmUgZHJvcCB0aGUgZXJyb3IgYW5k
IHJlcG9ydCBzdWNjZXNzIHRvIGNsb2NrX3NldHRpbWUoKSBhbmQKPiA+ID4gPiA+ID4gPiBjbG9j
a19hZGp0aW1lKCksIHNvIGEgZGVhZCBQVFAgcmVmZXJlbmNlIGNsb2NrIGdvZXMgdW5ub3RpY2Vk
IGJ5Cj4gPiA+ID4gPiA+ID4gcHRwNGwvcGhjMnN5cy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+IFJldHVybiBlcnJvciBjb2RlcyBmcm9tIHN0bW1hY191cGRhdGVfc3Vic2Vjb25kX2luY3Jl
bWVudCgpLAo+ID4gPiA+ID4gPiA+IHN0bW1hY19pbml0X3RzdGFtcF9jb3VudGVyKCksIHN0bW1h
Y19kbF90c19jb2Fyc2Vfc2V0KCkgYW5kIHRoZQo+ID4gPiA+ID4gPiA+IHNldHRpbWU2NC9hZGpm
aW5lIGNhbGxiYWNrcyBpbnN0ZWFkIG9mIHNpbGVudGx5IHJldHVybmluZyBzdWNjZXNzLiBPbgo+
ID4gPiA+ID4gPiA+IGZhaWx1cmUsIHJvbGwgYmFjayB0aGUgcGFydGlhbGx5IGFwcGxpZWQgY29u
ZmlndXJhdGlvbiBzbyB0aGUgaGFyZHdhcmUKPiA+ID4gPiA+ID4gPiBhbmQgdGhlIGRyaXZlciBi
b29ra2VlcGluZyBzdGF5IGNvbnNpc3RlbnQsIGFuZCByZXBvcnQgdGhlIHJlYXNvbgo+ID4gPiA+
ID4gPiA+IHRocm91Z2ggdGhlIGRldmxpbmsgZXh0YWNrLiBBbHNvIGd1YXJkIGFnYWluc3QgYSB6
ZXJvIHN1Yi1zZWNvbmQKPiA+ID4gPiA+ID4gPiBpbmNyZW1lbnQsIHdoaWNoIHdvdWxkIG90aGVy
d2lzZSBkaXZpZGUgYnkgemVybyB3aGVuIGNvbXB1dGluZyB0aGUKPiA+ID4gPiA+ID4gPiBhZGRl
bmQuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBSZXNldCB0aGUgcGVyc2lzdGVudCB0aW1l
c3RhbXBpbmcgc3RhdGUgKGh3dHNfdHhfZW4sIGh3dHNfcnhfZW4sCj4gPiA+ID4gPiA+ID4gdHN0
YW1wX2NvbmZpZywgc3lzdGltZV9mbGFncyBhbmQgdHNmdXBkdF9jb2Fyc2UpIHdoZW4gKHJlKWlu
aXRpYWxpemluZwo+ID4gPiA+ID4gPiA+IHRpbWVzdGFtcGluZywgc28gYSBmYWlsZWQgaW5pdCBk
b2VzIG5vdCBsZWF2ZSBUWC9SWCB0aW1lc3RhbXBpbmcKPiA+ID4gPiA+ID4gPiBlbmFibGVkIG9u
IGEgY291bnRlciB0aGF0IG5ldmVyIHN0YXJ0ZWQuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBGaXhlczogY2M0YzkwMDFjZTMxICgibmV0OiBzdG1tYWM6IFN3aXRjaCBzdG1tYWNfaHd0aW1l
c3RhbXAgdG8gZ2VuZXJpYyBIVyBJbnRlcmZhY2UgSGVscGVycyIpCj4gPiA+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogTG9yZW56byBCaWFuY29uaSA8bG9yZW56by5iaWFuY29uaUBvc3MucXVhbGNv
bW0uY29tPgo+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+IENoYW5nZXMgaW4gdjM6Cj4g
PiA+ID4gPiA+ID4gLSBEbyBub3QgcnVuIHN0bW1hY19jb25maWdfYWRkZW5kKCkgaW4KPiA+ID4g
PiA+ID4gPiAgIHN0bW1hY191cGRhdGVfc3Vic2Vjb25kX2luY3JlbWVudCgpIGVycm9yIHBhdGgu
Cj4gPiA+ID4gPiA+ID4gLSBSZXR1cm4gZXJyb3IgZnJvbSBzdG1tYWNfYWRqdXN0X2ZyZXEoKSBh
bmQgc3RtbWFjX3NldF90aW1lKCkuCj4gPiA+ID4gPiA+ID4gLSBSZXNldCBodyB0cyBjb25maWd1
cmF0aW9uIGluIHN0bW1hY19pbml0X3RpbWVzdGFtcGluZygpLgo+ID4gPiA+ID4gPiA+IC0gTGlu
ayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDkyNC1zdG1tYWMtcHRwLWFk
ZGVkLXN5c3RpbWUtZXJyb3ItdjItMS1iZWIyYTZiNWY4NjZAb3NzLnF1YWxjb21tLmNvbQo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gPiA+ID4gPiAtIElu
aXRpYWxpemUgc2VjX2luYyB0byAwIGluIHN0bW1hY19yZXN0b3JlX3N1YnNlY29uZF9pbmNyZW1l
bnQoKQo+ID4gPiA+ID4gPiA+ICAgcm91dGluZS4KPiA+ID4gPiA+ID4gPiAtIExpbmsgdG8gdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA5MjAtc3RtbWFjLXB0cC1hZGRlZC1zeXN0
aW1lLWVycm9yLXYxLTEtOGFjOWU3YTNmY2UyQG9zcy5xdWFsY29tbS5jb20KPiA+ID4gPiA+ID4g
PiAtLS0KPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjX21haW4uYyB8IDEwNiArKysrKysrKysrKysrKysrLS0tLS0tCj4gPiA+ID4gPiA+ID4g
IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wdHAuYyAgfCAgMTAg
Ky0KPiA+ID4gPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NCBpbnNlcnRpb25zKCspLCAzMiBk
ZWxldGlvbnMoLSkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSGVsbG8sIEknbSBub3RpY2luZyB0
aGF0IGFmdGVyIHRoaXMgcGF0Y2ggd2FzIG1lcmdlZCBpbnRvIGxpbnV4LW5leHQsCj4gPiA+ID4g
PiA+IGJvb3Qgc2VlbXMgdG8gaGFuZyB3aGVuIGlwPWRoY3AgaXMgdXNlZCBiZWNhdXNlIGV0aGVy
bmV0IGlzbid0IHdvcmtpbmcKPiA+ID4gPiA+ID4gb24gdGhlIFRIMTUyMCBMaWNoZWUgUGkgNGEu
IFRoZXNlIGxpbmVzIGdldCBwcmludGVkIGluIGEgbG9vcCBvdmVyIGFuZAo+ID4gPiA+ID4gPiBv
dmVyCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IElQLUNvbmZpZzogZW5kMCBoYXJkd2FyZSBhZGRy
ZXNzIDcyOmNhOmE4OmViOjI3OlsgICAyNC44NzI5ODJdIHRoZWFkLWR3bWFjIGZmZTcwNzAwMDAu
ZXRoZXJuZXQgZW5kMDogUmVnaXN0ZXIgTUVNX1RZUEVfUEFHRV9QT09MIFJ4US0wCj4gPiA+ID4g
PiA+IGYyIG10dSAxNTAwIERIQ1AKPiA+ID4gPiA+ID4gWyAgIDI0LjkwMDQxMl0gdGhlYWQtZHdt
YWMgZmZlNzA3MDAwMC5ldGhlcm5ldCBlbmQwOiBQSFkgW3N0bW1hYy0wOjAxXSBkcml2ZXIgW1JU
TDgyMTFGIEdpZ2FiaXQgRXRoZXJuZXRdIChpcnE9UE9MTCkKPiA+ID4gPiA+ID4gWyAgIDI0Ljkx
Mjc4MF0gZHdtYWMxMDAwOiBNYXN0ZXIgQVhJIHBlcmZvcm1zIGFueSBidXJzdCBsZW5ndGgKPiA+
ID4gPiA+ID4gWyAgIDI0LjkxMjgwMV0gdGhlYWQtZHdtYWMgZmZlNzA3MDAwMC5ldGhlcm5ldCBl
bmQwOiBObyBTYWZldHkgRmVhdHVyZXMgc3VwcG9ydCBmb3VuZAo+ID4gPiA+ID4gPiBbICAgMjUu
MDEwMjI5XSB0aGVhZC1kd21hYyBmZmU3MDcwMDAwLmV0aGVybmV0IGVuZDA6IFBUUCBpbml0IGZh
aWxlZAo+ID4gPiA+ID4gPiBTSU9DU0lGRkxBR1M6IENvbm5lY3Rpb24gdGltZWQgb3V0Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gSGkgQW5pcnVkaCwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBiYXNlZCBvbiB0
aGUgcmVwb3J0ZWQgZXJyb3IsIHN0bW1hY19pbml0X3RzdGFtcF9jb3VudGVyKCkgZmFpbHMgd2l0
aAo+ID4gPiA+ID4gLUVUSU1FRE9VVC4gSW4gcGFydGljdWxhciB0aGlzIGNhbiBvY2N1cnMgaWY6
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gc3RtbWFjX2luaXRfdHN0YW1wX2NvdW50ZXIoKQo+ID4gPiA+
ID4gIC0+IHN0bW1hY191cGRhdGVfc3Vic2Vjb25kX2luY3JlbWVudCgpIC0+IHN0bW1hY19jb25m
aWdfYWRkZW5kKCkgLT4gLUVUSU1FRE9VVAo+ID4gPiA+ID4gIC0+IHN0bW1hY19pbml0X3N5c3Rp
bWUoKSAtPiAtRVRJTUVET1VUCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBndWVzcyB3ZSBzaG91bGQg
dW5kZXJzdGFuZCB3aGljaCBvbmUgaXMgZmFpbGluZyBhbmQgd2h5IGl0IGlzIGZhaWxpbmcuCj4g
PiA+ID4KPiA+ID4gPiBJdCBzZWVtcyBsaWtlIGJvdGggYXJlIHRpbWluZyBvdXQsIGJvdGggY29u
ZmlnX2FkZGVuZAo+ID4gPiA+IChQVFBfVENSX1RTQUREUkVHKSBhbmQgaW5pdF9zeXN0aW1lIChQ
VFBfVENSX1RTSU5JVCkuCj4gPiA+Cj4gPiA+IEl0IHNlZW1zIGh3IHRpbWVzdGFtcGluZyBoYXMg
bmV2ZXIgd29ya2VkIG9uIHRoaXMgYm9hcmQsIGl0IHdhcyBqdXN0Cj4gPiA+IHVuZGlzY292ZXJl
ZCBzaW5jZSBzdG1tYWNfaW5pdF90c3RhbXBfY291bnRlcigpIHdhcyBub3QgcmVwb3J0aW5nIGFu
eQo+ID4gPiBlcnJvciBiZWZvcmUgKHRoaXMgaXMgZXhhY3RseSB0aGUgZ29hbCBvZiB0aGlzIHBh
dGNoKS4KPiA+ID4KPiA+ID4gV2hhdCBhcmUgdGhlIG91dHB1dCBmb3I6Cj4gPiA+IC0gSUVFRSAx
NTg4LTIwMDIgVGltZSBTdGFtcAo+ID4gPiAtIElFRUUgMTU4OC0yMDA4IEFkdmFuY2VkIFRpbWUg
U3RhbXAKPiA+ID4KPiA+ID4gcm9vdEByYjMtZ2VuMjp+IyBncmVwICdUaW1lIFN0YW1wJyAvc3lz
L2tlcm5lbC9kZWJ1Zy9zdG1tYWNldGgvZXRoMC9kbWFfY2FwCj4gPiA+IElFRUUgMTU4OC0yMDAy
IFRpbWUgU3RhbXA6IE4KPiA+ID4gSUVFRSAxNTg4LTIwMDggQWR2YW5jZWQgVGltZSBTdGFtcDog
WQo+ID4KPiA+IFRoaXMgaXMgd2hhdCBJIHNlZQo+ID4KPiA+IHJvb3RAZGViaWFuLXRyaXhpZS1y
aXNjdjY0Oi8jIGdyZXAgJ1RpbWUgU3RhbXAnCj4gPiAvc3lzL2tlcm5lbC9kZWJ1Zy9zdG1tYWNl
dGgvZW5kMC9kbWFfY2FwCj4gPiBJRUVFIDE1ODgtMjAwMiBUaW1lIFN0YW1wOiBOCj4gPiBJRUVF
IDE1ODgtMjAwOCBBZHZhbmNlZCBUaW1lIFN0YW1wOiBZCj4KPiBVbmZvcnR1bmF0ZWx5IEkgZG8g
bm90IGhhdmUgdGhpcyBib2FyZCBmb3IgZGVidWdnaW5nLiBUaGUgZmlyc3QgaWRlYQo+IEkgZ290
IGlzIG1heWJlIDEwMG1zIGlzIHRvbyBzbWFsbCBmb3IgdGhpcyBTb0M/IENhbiB5b3UgcGxlYXNl
IHRyeSB0bwo+IGluY3JlYXNlIGl0IHRvIGxpa2UgNTAwbXM/CgpUaGF0IGRvZXNuJ3QgaGVscCBl
aXRoZXIuCgpNYXliZSBzb21lb25lIG1vcmUgZmFtaWxpYXIgd2l0aCB0aGlzIGJvYXJkL2hhcyB1
c2VkIFBUUCBvbiBpdCBiZWZvcmUKY2FuIGhlbHAgb3V0IHVuZGVyc3RhbmRpbmcgd2h5IHRoaXMg
aXMgaGFwcGVuaW5nLiBNYXliZSB0aGlzIGlzIHNvbWUKaXNzdWUgdG8gZG8gd2l0aCBjbG9ja3Mu
CgpSZWdhcmRzCkFuaXJ1ZGgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
