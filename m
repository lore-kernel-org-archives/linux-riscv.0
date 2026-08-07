Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA80FC5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNrqGvmKsBRRgS0r+sc7er1G7yRdht5cCnQgOnj4NGI=; b=KIg1PRVS7lZg/d
	D5hrby/LSRUw75bjFjV8wb/sHWpfKTmK0gTtYP+vWdv+UmSUjaajk1mBRndgD/pWj04XitOW2l9R8
	PR9y/M9x/MwBaZ2dDrQQ75gvtL89lCa/TGvG1Oky8zvsDBdPqfqb/0v/RXGs0UXFrbetC3mxMYtvw
	FKEqqupiqfhDgJojq6Jkvnpfn26woixhP9wiEncFvJAl5qxFZrHUmtQQ74uxMI7OcNTBp07MosG43
	s1t+dkWkC3RS+WckBmGXrzx2FJpmDNcFsUoWBQpJlQSJL8/i6cmmFcvBzn1WdNZYbhyUPaswBykkG
	no1M5ao95TZAwsXhMwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEa-00000007HPt-07rd;
	Fri, 07 Aug 2026 07:43:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEZ-00000007HPC-0rfU
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=; b=lkRXYB3mMaio6EtnBjQ0n7Bk8R
	YSGscCvbw0ZC0rZY+EpcC9olB7+CrZej6Zuymb6bTNJEB1hBrfInzaQAvbjBwRXzZoMLnvXigSwvU
	zPtyibHsmNHUOVrKCW6qj8EXhL/LxBlTHAFQEalipOLgB/U2V1dHjvCKUGRROXe7oBwS/o2pZm3d2
	bFersqDlSYA509wxs1OcgzAu1dVx9Z1c/dTb6rkq3zTuLmjKzk0hONw5FGNfGFgGrmd0gmzm1ub0J
	R9zuVAhzu7LhQbPEupxCvbte7+ObSNzfqcqoMKjd50S1dH/h1Czl/PhXojbVB7+3wj34INyYOqka1
	BlXHG2Zw==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFEW-0000000C9PS-0OGw
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:43:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47f6609c657so1497756f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088591; x=1786693391; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=;
        b=RyTBtQ78dpnGXmS/v06dZUmPTK5tjsyfC1PFSjbi65JokcSwA0YZmOzInlucxo6a2K
         LPfjGYcwiHoPw1LFq280wZqsaCGGQ4ooU64OIwafkNCjDXyBjxyVdw12iA38K9tyjeLN
         WAC1modtAiV2Eokpoh6/VZyBKct0ZGVljBi0Hz3Qc6uOk+bqctc6+H92FqNuScfw7ux3
         ksJ/hX/TfciLASzSjrSH8Ya97uF9mX6y++hbD9gTPlGWU5n1/+UfKcGQjdbisnlucGC0
         HHpxn6Er2RufYkxlFw8OwlTJMe6U1DZ9Ohw/UybsM8B7wd0b1K6odNxj0pDy/hauC0G3
         KoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088591; x=1786693391;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qp8n1eykcjli1ON25O/cMqkIDEqgBT+HFe8eeuMsJIk=;
        b=Fyhq5QDmFuT+hDAzoz74b6K4SWWo77diqC7wTU7YSPoTzClR6/Vx2d6U7/Mrxv7npZ
         5tUYDViRNlKghWwhjeb0mJaoz0rtCLO9QuOx11cuz1JfZXzPys1JlifOIO1Um7wDC60+
         t3j77MBO+zT5sF4QDrCFrAOBWDzTmYbA6F9MdzLWwUDpzlkyOx+RhiJ9WGeT/E2GGNzF
         s5GDeal8vWG+XXxIAyLddFpEZux65uv/jEQi8ULC1f3LICFGjWA9Wp+F4UGuNG9gXDmK
         yAyfkWvFhpdms/XKohzUFhX0YkeNCIrFnuD5VvrkgULE3PrMNYZwG0zbylwNnwrrU6H/
         eJ1w==
X-Forwarded-Encrypted: i=1; AHgh+RpJQQWXRUt1dPx1Qyy5bBNKXX4twclg9IgDetD7MlPmj9/stafVfIgKSRVK8WSFjqRwhsgZ6A1z5tcekQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzozVlCpo19L0Hr9on9QKiCC50ahKRqVFLHfwcIClhlk7ESsvB6
	Ja9ZR8+Pjl57pXsACVTDo8SejZrU7kzzw3S8OGa4wTTFLnvmBloFQaXGJudRP3Wt6QTD
X-Gm-Gg: AR+sD11bj0eo7M6Bl3u9zOR3l/AS6FjcMOVBYdDbKFKla9wmYNA9FRn8XHN0SAlB4Ku
	9K4XOELwxRxgOne4LOPYRob8/pOAGl92r+bDgQthSX6kbWAkA2QbyH5zdCNW7+rub27q1CLl3Jt
	+Y5EEj2z/3jQP8sFc0tvnFeNT1we+neeCqrgReDMY1A/6DiKQ0aqdZXzIOTEiceZnqGNowHqD14
	3iOFWIvyiWBkCQ/GwBn2haYnIC4bZhiE/tZPFN2NAxvdq25pbOddl578GuNsvRGu4RVG1EFXzl6
	u26TVk/u5ZIfK9/yXh4+G64tOvP4Duft9z66HLuXdA2UMWj7pEHiN/gMGgA32BiJkjoP5YJeqP3
	Ejv81+sjk21N7VriD0McqR5uW+KwHKZVvX7S8TjTBuFpwPMzqeZdIxBTgxqCfe0ikbPfkOyRhe1
	WzzRrOwSPWbfkwsyoqP0+VS1RLWS57N2g1FKEoF34/gFr56ucrVanaeV7RPwqX8Ab3nZGHdJ25M
	Rn0GopmE1r72XsDsB9rGJQMSe8QkCOHwQ==
X-Received: by 2002:a05:600c:35d1:b0:499:5e9e:1f50 with SMTP id 5b1f17b1804b1-4995e9e207dmr18816635e9.4.1786088590793;
        Fri, 07 Aug 2026 00:43:10 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8cd0sm3174147f8f.17.2026.08.07.00.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:43:10 -0700 (PDT)
Message-ID: <20f4dad8-0ac5-4fc0-866a-38721371ba63@osyx.tech>
Date: Fri, 7 Aug 2026 08:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 3/6] dt-bindings: Add Bao I/O dispatcher driver binding
To: Krzysztof Kozlowski <krzk@kernel.org>, joaopeixoto@osyx.tech,
 linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-4-joaopeixoto@osyx.tech>
 <35100734-e2ea-459e-9b47-5cc62aa99b38@kernel.org>
Content-Language: en-US
In-Reply-To: <35100734-e2ea-459e-9b47-5cc62aa99b38@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084312_507029_33272F05 
X-CRM114-Status: GOOD (  14.87  )
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

Ck9uIDEvNy8yNiAxNjo0NywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAwNy8wMS8y
MDI2IDE3OjI4LGpvYW9wZWl4b3RvQG9zeXgudGVjaCB3cm90ZToKPj4gRnJvbTogSm/Do28gUGVp
eG90bzxqb2FvcGVpeG90b0Bvc3l4LnRlY2g+Cj4+Cj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBh
IGRldmljZSB0cmVlIGJpbmRpbmcgZm9yIHRoZSBCYW8gSS9PIERpc3BhdGNoZXIsCj4+IGEgZGV2
aWNlIHVzZWQgaW4gYmFja2VuZCBWTXMgcnVubmluZyB2aXJ0dWFsaXplZCBkZXZpY2VzIChlLmcu
LCBWaXJ0SU8pLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb8OjbyBQZWl4b3RvPGpvYW9wZWl4b3Rv
QG9zeXgudGVjaD4KPj4gLS0tCj4+ICAgLi4uL2JpbmRpbmdzL2Jhby9iYW8saW8tZGlzcGF0Y2hl
ci55YW1sICAgICAgIHwgNzUgKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA3NSBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vYmFvLGlvLWRpc3BhdGNoZXIueWFtbAo+Pgo+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Jhby9iYW8saW8tZGlz
cGF0Y2hlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Jhby9iYW8s
aW8tZGlzcGF0Y2hlci55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAw
MDAwMDAwMC4uOGNhNDUwZTRiOWQ1Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Jhby9iYW8saW8tZGlzcGF0Y2hlci55YW1sCj4+IEBA
IC0wLDAgKzEsNzUgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UKPj4gKyVZQU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6aHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvYmFvL2Jhbyxpby1kaXNwYXRjaGVyLnlhbWwjCj4+ICskc2No
ZW1hOmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+
ICt0aXRsZTogQmFvIEkvTyBEaXNwYXRjaGVyIERldmljZQo+IE5vLCB5b3UgZG9uJ3QgZ2V0IG11
bHRpcGxlIGRldmljZXMgcGVyIGV2ZXJ5IGRyaXZlci4KPgo+IExvb2sgYXQgZ3VueWFoIG9yIE1l
ZGlhdGVrIEdlbmlvLiBDb21lIGJhY2sgd2hlbiB5b3Ugc29sdmUgRU5USVJFCj4gRkVFREJBQ0sg
Z2l2ZW4gdG8gdGhlbSBmaXJzdC4gQW5kIHRoZW4gc2F5IGhvdyB5b3Ugc29sdmVkIHRoYXQgZmVl
ZGJhY2sKPiBiZWNhdXNlIHNvIGZhciBJIHNlZSB5b3Ugb25seSBpZ25vcmluZyByZXZpZXcgb2Yg
eW91ciBMTE0gc2xvcCBvciBvdGhlcgo+IE1pY3Jvc2xvcCBwcm9kdWN0Lgo+Cj4gQmVzdCByZWdh
cmRzLAo+IEtyenlzenRvZgpUaGFua3MgZm9yIHRoZSBwb2ludGVycywgYW5kIHNvcnJ5IGZvciB0
aGUgZWFybGllciBjaHVybi4gSSBsb29rZWQgYXQgaG93Cmd1bnlhaCBhbmQgdGhlIE1lZGlhdGVr
IEdlbmlvIGJpbmRpbmdzIG1vZGVsIHRoaXMgYW5kIHJld29ya2VkIHRoZSAKZGlzcGF0Y2hlcgp0
aGUgc2FtZSB3YXk6IHRoZXJlIGlzIG5vIGxvbmdlciBhIHNpbmdsZSBub2RlIGRlc2NyaWJpbmcg
TiBkZXZpY2VzLiBFYWNoCmJhY2tlbmQgZGV2aWNlIGlzIGl0cyBvd24gbm9kZSB3aXRoIG9uZSBy
ZWcgcmVnaW9uIGFuZCBvbmUgaW50ZXJydXB0OgoKIMKgIHNobWVtQDUwMDAwMDAwIHsKIMKgIMKg
IMKgIGNvbXBhdGlibGUgPSAiYmFvLGlvLWRpc3BhdGNoZXIiOwogwqAgwqAgwqAgcmVnID0gPDB4
NTAwMDAwMDAgMHgwMTAwMDAwMD47CiDCoCDCoCDCoCBpbnRlcnJ1cHRzID0gPDB4MCAweDA4IDB4
MT47CiDCoCDCoCDCoCBiYW8saWQgPSA8MD47CiDCoCB9OwoKQSBiYWNrZW5kIGd1ZXN0IHRoYXQg
c2VydmljZXMgc2V2ZXJhbCBmcm9udGVuZHMgaW5zdGFudGlhdGVzIHNldmVyYWwgc3VjaApub2Rl
cy4gcmVnIGFuZCBpbnRlcnJ1cHRzIHRoZXJlZm9yZSBoYXZlIG1heEl0ZW1zOiAxLiBUaGUgZHJp
dmVyIHdhcwpyZXdyaXR0ZW4gdG8gbWF0Y2ggKG9uZSBwbGF0Zm9ybSBkZXZpY2UgLT4gb25lIGRl
dmljZSBtb2RlbCAtPiBvbmUKL2Rldi9iYW8tZG1YKSBkcm9wcGluZyB0aGUgaW50ZXJuYWwgTi1k
ZXZpY2UgYXJyYXksIHRoZSBnbG9iYWwgRE0gbGlzdCBhbmQKdGhlIGluZGlyZWN0aW9uIGlvY3Rs
LgoKSSBoYXZlIGFsc28gZ29uZSB0aHJvdWdoIHRoZSByZXN0IG9mIHRoZSBmZWVkYmFjayBvbiB0
aGUgc2VyaWVzICh0aGUgCmlwY3NobWVtCmJpbmRpbmcsIHRoZSBtaXNjLWRldmljZSBjb252ZXJz
aW9uLCBjb21taXQgbWVzc2FnZXMsIGNoYW5nZWxvZywgdGhyZWFkaW5nKQphbmQgYWRkcmVzc2Vk
IGVhY2ggaXRlbTsgdGhlIGNvdmVyIGxldHRlciBlbnVtZXJhdGVzIHRoZW0uIFRoZSBiaW5kaW5n
IApwYXNzZXMKYG1ha2UgZHRfYmluZGluZ19jaGVja2AuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
