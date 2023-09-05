Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F1EC83F3E
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 15:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fylBYbKUP3ycboDGSFP7LFsApPkeqQwpPq4Re3i5AoY=; b=UaWhhYK8JZaXtd
	D/5MV5MQGEY/PxOhk/zy25E60gIhfzx137xid09RLQCz//dnCdNn2dd1ihZ7aLtVP/WO5LZyL/QWb
	B8d2RMep6JXRD05xbvCFB7hL75VcxYl8MhXW/gyrpbmI0lFLhiIQIRsTtddiwFIHYb1J1yr9jpEbl
	5PqgQZ45jp4HFmor16GDnhCkZkD8We19BIC3mtrRBTkG+KXVX4KPG1nWpKDCfTTjSFUv5KBSw46qN
	H1obWhcc3XIu9dHmvx5DHKX5VvFd+IWJxoEjmh+eCKl/7W1675HHrE3UFOl0/tg4AQ9P0oefPJUEv
	pOqA0wGKRux4uBMdU7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXeM-006EnB-1M;
	Tue, 05 Sep 2023 15:07:30 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXeJ-006Elx-1e
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 15:07:29 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bcda0aaf47so41168601fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1693926442; x=1694531242; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8d5KFcSRcmH0JCc/DKLzz+3RGk6xH5isDQxBMPU7qY=;
        b=TWZt+yh58rCgHruIgWQLTBs2kDnMdX9WoPImWXzZSpMyVtKz5AVyknQS8iuUu1yzP6
         Zyg1Wgndaz9fCMlfeuBPn12LI5mDBuiSvwu0Q+QN7DZ4+UCFvUGjasfuI0WvrFWFgPRe
         jJITT9edUACM2KFmEX2dSOtiZRpELd9rILc2r3zXIg6K3IBlmpx3SjY2GNiBxsb81rR0
         g97uIJptA98UHJEAitBM6zvmrMoQjsNNxu/IuZ+36oqywHCmj2c4GYkp1GKGhnb1hIjC
         S7X7zd4YBfHp7mE0HofeAjKod8NRGi2zt+0rq6kflYvqK60Y5G/niEWmkbqljVW+HAfK
         wNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693926442; x=1694531242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8d5KFcSRcmH0JCc/DKLzz+3RGk6xH5isDQxBMPU7qY=;
        b=kIsNiEuUA2wDrBfWJxBlJ/lsOhVxTdBotcwkoIbDxuTY/Ow3VW8QYi8u+e7UIaKLRj
         kx3G6pDItqiJ3S0B5MDKgm5VnY7QjaHmK6bmgYeW6n0sWdNToazzAicvAzacpaLDBAFH
         v6F5D4af0WQuHu/enCvzD3BRapMYxKb5LpQ6TpXCPYQGKH6F9OexprCDcAOxqtIw04ZO
         bTImYIv4FIf9rlEt6L9k7LKz/jrhhufVped63GzwVuXQMAA1AAF9X0gCFy2SjNEbPSIY
         dePuG/Pf5Y+NDyBco4fZfm7/VTGyiPCI6NPGuSPzlFP6KsdtiKx35jJ3e8iNaYIzl7lP
         k+bA==
X-Gm-Message-State: AOJu0YwbG+mN7PdBP8HSXIAE+bRR51NalGNV2/rNkoCmtQ5xdBo+GyEb
	S2goz1ATbHtH/nLRfsepoVFA9o624Z84cMLt69cIaQ==
X-Google-Smtp-Source: AGHT+IHOnDDzrKhACbl2MVW/szUGryvjFTJ7hcXSlFr4SFXnR0m9slCKMXPxqlVlZCIWngKKVMz0uryu42aXAN6j2Ks=
X-Received: by 2002:a2e:7c09:0:b0:2bb:94e4:6b07 with SMTP id
 x9-20020a2e7c09000000b002bb94e46b07mr34242ljc.12.1693926442628; Tue, 05 Sep
 2023 08:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230720135125.21240-1-eric.lin@sifive.com> <20230720135125.21240-2-eric.lin@sifive.com>
 <20230720-slept-guru-216e2803061e@spud>
In-Reply-To: <20230720-slept-guru-216e2803061e@spud>
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 5 Sep 2023 23:07:11 +0800
Message-ID: <CAPqJEFrM51aQrcVgj8RFvai4QPR2+iOC=ueqFpU0oNX+h4aQbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Conor Dooley <conor@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_080727_578711_B24E93A6 
X-CRM114-Status: GOOD (  22.34  )
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

SGkgQ29ub3IgYW5kIEtyenlzenRvZiwKCk9uIEZyaSwgSnVsIDIxLCAyMDIzIGF0IDE6MTDigK9B
TSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGV5IEVyaWMsCj4K
PiBPbiBUaHUsIEp1bCAyMCwgMjAyMyBhdCAwOTo1MToxOVBNICswODAwLCBFcmljIExpbiB3cm90
ZToKPiA+IFRoaXMgYWRkIFlBTUwgRFQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBTaUZpdmUg
UHJpdmF0ZSBMMgo+ID4gY2FjaGUgY29udHJvbGxlcgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEVy
aWMgTGluIDxlcmljLmxpbkBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFpvbmcgTGkgPHpv
bmcubGlAc2lmaXZlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYmluZGluZ3MvY2FjaGUvc2lmaXZlLHBsMmNhY2hlLnlh
bWwgICAgICAgfCA2MiArKysrKysrKysrKysrKysrKysrCj4KPiBidHcsIHlvdXIgJHN1YmplY3Qg
c2hvdWxkIGJlICJkdC1iaW5kaW5nczogY2FjaGU6IC4uLi4iIHJhdGhlciB0aGFuCj4gInJpc2N2
OiBzaWZpdmUiLgo+Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NhY2hl
L3NpZml2ZSxwbDJjYWNoZS55YW1sCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNoZS9zaWZpdmUscGwyY2FjaGUueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jYWNoZS9zaWZpdmUscGwyY2FjaGUueWFtbAo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWU4MzU2YzVlZWVl
Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvY2FjaGUvc2lmaXZlLHBsMmNhY2hlLnlhbWwKPiA+IEBAIC0wLDAgKzEsNjIgQEAKPiA+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4g
PiArIyBDb3B5cmlnaHQgKEMpIDIwMjMgU2lGaXZlLCBJbmMuCj4gPiArJVlBTUwgMS4yCj4gPiAr
LS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9jYWNoZS9zaWZpdmUs
cGwyY2FjaGUueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogU2lGaXZlIFByaXZhdGUgTDIgQ2Fj
aGUgQ29udHJvbGxlcgo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBHcmVlbnRpbWUg
SHUgIDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+ICsgIC0gRXJpYyBMaW4gIDxlcmljLmxp
bkBzaWZpdmUuY29tPgo+Cj4gVGhlcmUncyBleHRyYSBzcGFjZXMgaW4gdGhlc2UgbGluZXMgZm9y
IHNvbWUgcmVhc29uLgo+Cj4gPiArCj4gPiArZGVzY3JpcHRpb246Cj4gPiArICBUaGUgU2lGaXZl
IFByaXZhdGUgTDIgQ2FjaGUgQ29udHJvbGxlciBpcyBwZXIgY29yZSBhbmQKPiA+ICsgIGNvbW11
bmljYXRlcyB3aXRoIGJvdGggdGhlIHVwc3RyZWFtIEwxIGNhY2hlcyBhbmQKPiA+ICsgIGRvd25z
dHJlYW0gTDMgY2FjaGUgb3IgbWVtb3J5LCBlbmFibGluZyBhIGhpZ2gtcGVyZm9ybWFuY2UKPiA+
ICsgIGNhY2hlIHN1YnN5c3RlbS4KPiA+ICsKPiA+ICthbGxPZjoKPiA+ICsgIC0gJHJlZjogL3Nj
aGVtYXMvY2FjaGUtY29udHJvbGxlci55YW1sIwo+ID4gKwo+Cj4gSSdtIHByZXR0eSBzdXJlIHRo
YXQgSSBwb2ludGVkIG91dCBsYXN0IHRpbWUgYXJvdW5kIHRoYXQgeW91IG5lZWQgdG8gYWRkCj4g
c29tZXRoaW5nIGxpa2UgaW4gdGhlIGNjYWNoZSBkcml2ZXI6Cj4KPiBzZWxlY3Q6Cj4gICBwcm9w
ZXJ0aWVzOgo+ICAgICBjb21wYXRpYmxlOgo+ICAgICAgIGNvbnRhaW5zOgo+ICAgICAgICAgZW51
bToKPiAgICAgICAgICAgLSBzaWZpdmUsY2NhY2hlMAo+ICAgICAgICAgICAtIHNpZml2ZSxmdTU0
MC1jMDAwLWNjYWNoZQo+ICAgICAgICAgICAtIHNpZml2ZSxmdTc0MC1jMDAwLWNjYWNoZQo+Cj4g
b3RoZXJ3aXNlIHRoaXMgYmluZGluZyB3aWxsIGJlIHVzZWQgZm9yIGFueXRoaW5nIGNvbnRhaW5p
bmcgImNhY2hlIiBpbgo+IHRoZSBkdC1iaW5kaW5nLgo+IEZvciB0aGlzIGJpbmRpbmcsIEkgdGhp
bmsgdGhhdCB0aGUgZm9sbG93aW5nIGlzIHN1ZmZpY2llbnQ6Cj4KPiBzZWxlY3Q6Cj4gICBwcm9w
ZXJ0aWVzOgo+ICAgICBjb21wYXRpYmxlOgo+ICAgICAgIGNvbnRhaW5zOgo+ICAgICAgICAgICBj
b25zdDogc2lmaXZlLHBsMmNhY2hlMQo+Cj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGli
bGU6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0gY29uc3Q6IHNpZml2ZSxwbDJjYWNoZTEK
PiA+ICsgICAgICAtIGNvbnN0OiBjYWNoZQo+Cj4gWW91IG9taXR0ZWQgdGhlIHBsMmNhY2hlMCBm
cm9tIGhlcmUsIHRoYXQgbmVlZHMgdG8gY29tZSBiYWNrISBZb3UnbGwgZW5kCj4gdXAgd2l0aCAy
IGl0ZW1zIGVudHJpZXMuCj4gRWl0aGVyIHdheSwgSSBjYW4ndCB0YWtlIHRoaXMgYmluZGluZyB3
aXRob3V0IGEgc29jLXNwZWNpZmljIGNvbXBhdGlibGUsCj4gcGVyIHNpZml2ZS1ibG9ja3MtaXAt
dmVyc2lvbmluZy50eHQuLgo+ClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KT0ssIEkgd2lsbCB3
YWl0IHVudGlsIHRoZSBjdXN0b21lcidzIFNvQyB0YXBlLW91dCBiZWZvcmUgdXBzdHJlYW1pbmcK
dGhlIFBMMiBjYWNoZSBhbmQgUE1VIGRyaXZlcnMuClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcu
CgpCZXN0IHJlZ2FyZHMsCkVyaWMgTGluCgo+IFRoYW5rcywKPiBDb25vci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
