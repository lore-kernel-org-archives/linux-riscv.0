Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE916E7070A
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qmzn3wnbiQKXf4Wf198V7U7Qe0Ut6IAUCBkPFYmdbFc=; b=2owmLU0r6KTUMY
	nprPmeHx9jWIxL5dk6qxEEIUkwOaBCbKi2CF4RgQ2HZ7VnmL0fydlWPdv1ZQ4WFVKTKyE2AKOxAck
	f1+OJQFhso0ZArxj+CBccr/PzCGoAvg7QnO0a5T3uGAEIv/NMyxrXcT1aelr0/51QdC4NyFFx2SY9
	9PDpSAGPhibM/GTcvWHsXzXOCcKvYEj5DRw3mdbz1NQlCjKqW6n8MWquvO1ilFoPd11Du3fn2D8Gt
	MVKpYLnKCS+oIOCP0tTXejoN+4n2tTDDGzGlI6/zqwxrCnGY0g23sOSHmqfwsbgCHf8hsriUAfC9r
	ECDxX7j60xre3e2437HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGoG-005hKa-0b;
	Thu, 21 Sep 2023 10:21:24 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGoD-005hK5-0K
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 10:21:22 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-65627d499e1so4191766d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695291679; x=1695896479; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAmdVadS4jiR5GzblmwpxzkMv/YPmugIu95wefEmcJc=;
        b=UB5rvQDiKst0pU2SG2GIScEeDIt5pZtslmWJg7zk8l5C7+u+RmCso8j8q+Y/jCDk9J
         8/pbOB5HPZgBkzEn6fdvHnAy0Z8c09UM6hZagmt7OiFGDedKoSNBWMQpxony7UpnCBUz
         v06bJSJWYRCORU8zAs9Vp/JQA61MvVStaMP41Zqs5kzKMnmraY5nbNY1Rk+tBiKeoe3r
         mLVFTKuFWPxMgVI/rZWD7/K92ymz9T7X5hyUmmFbOxYGmZTf+b2ukZOzoYNMvwJNp0+O
         ZCnagwn248TPYFNT63Zz+p08TZzPFZ7j0tzGs0/HWNOra+Aq7DxO44fqXNJjvV/7uDjr
         EAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695291679; x=1695896479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAmdVadS4jiR5GzblmwpxzkMv/YPmugIu95wefEmcJc=;
        b=ckUhtAGiYfXjFn0bHIWsJofhKmuAjFJW/Ng9FI7YqQRyfnfE2GNtTDVqL+7u1dDqR8
         Br7C1/VOgVTlcKfKUabujKAH4iKQdZhp8sXGqbI2Py0J3jR51D3ypQomPh5A8tkqynMa
         6bvtORX3DNTVM6EXLFAFO4qOhVXkTLKtwlXXlF4orht5iUIcKR2jEOVrCEXvTziqJ4F/
         oQ3gKflYkW156+LGMcbghaZLq7ofSDYUv5kEOfPCv8kwPbHFOQ1dCD+jOuxC8vmMjMV+
         iTCBaxQFYSWi8d/a1/2RO6zGBo5QSiCfgupuKtf563nFPTIUDVAA3MYcS3bM1LsXyHq8
         0khg==
X-Gm-Message-State: AOJu0YxqMFYT8JdbTqbddAo5Z5ToXaVbNuKmW9hJFmsVGMUszsE3ZZns
	VKopHtGYe+xu8wMz6Aa9tpG82l2iH+mBRlIQ9wY=
X-Google-Smtp-Source: AGHT+IHrZ874aKkUdfbv776TdxNWdIdVUn21Sf0N7vEUuJLhyrWz1QRiMxsOlbMIKfFPGhrHtZ1SgEc8c+fptK2rbDA=
X-Received: by 2002:a05:6214:249:b0:64f:67ae:a132 with SMTP id
 k9-20020a056214024900b0064f67aea132mr4510858qvt.23.1695291679027; Thu, 21 Sep
 2023 03:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
 <20230920-arrival-bonanza-e335686420f4@wendy>
In-Reply-To: <20230920-arrival-bonanza-e335686420f4@wendy>
From: Chen Wang <unicornxw@gmail.com>
Date: Thu, 21 Sep 2023 18:21:08 +0800
Message-ID: <CAHAQgRDh72FLQPOFzn2rhsWmOOaLUO0sKyJwJQBG0Z7qZN_YLw@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042 bindings
To: Conor Dooley <conor.dooley@microchip.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_032121_161790_BF3933E6 
X-CRM114-Status: GOOD (  31.09  )
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

UmVnYXJkcywKCnVuaWNvcm54CgpDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAu
Y29tPiDkuo4yMDIz5bm0OeaciDIw5pel5ZGo5LiJIDE2OjI55YaZ6YGT77yaCj4KPiBZbywKPgo+
IE9uIFdlZCwgU2VwIDIwLCAyMDIzIGF0IDAyOjM3OjUxUE0gKzA4MDAsIENoZW4gV2FuZyB3cm90
ZToKPiA+IEFkZCBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHRoZSBTb3BoZ28gU0cyMDQy
IFNvYyBbMV0gYW5kIHRoZQo+ID4gTWlsay1WIFBpb25lZXIgYm9hcmQgWzJdLgo+ID4KPiA+IFsx
XTogaHR0cHM6Ly9lbi5zb3BoZ28uY29tL3Byb2R1Y3QvaW50cm9kdWNlL3NnMjA0Mi5odG1sCj4g
PiBbMl06IGh0dHBzOi8vbWlsa3YuaW8vcGlvbmVlcgo+Cj4gQWdhaW4sIGxpbmsgdGFncyBwbGVh
c2UuCj4KPiA+IEFja2VkLWJ5OiBDaGFvIFdlaSA8Y2hhby53ZWlAc29waGdvLmNvbT4KPiA+IEFj
a2VkLWJ5OiBYaWFvZ3VhbmcgWGluZyA8eGlhb2d1YW5nLnhpbmdAc29waGdvLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IENoZW4gV2FuZyA8d2FuZ2NoZW4yMEBpc2Nhcy5hYy5jbj4KPiA+IC0tLQo+
ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NvcGhnby55YW1sICAgICB8IDI4ICsr
KysrKysrKysrKysrKysrKysKPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNyArKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9u
cygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NvcGhnby55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NvcGhnby55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi44MjQ2OGFlOTE1ZGIKPiA+IC0tLSAvZGV2L251
bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zb3Bo
Z28ueWFtbAo+ID4gQEAgLTAsMCArMSwyOCBAQAo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0t
LQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmlzY3Yvc29waGdvLnlh
bWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IFNvcGhnbyBTb0MtYmFzZWQgYm9hcmRzCj4gPiArCj4g
PiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIENoYW8gV2VpIDxjaGFvLndlaUBzb3BoZ28uY29tPgo+
ID4gKyAgLSBYaWFvZ3VhbmcgWGluZyA8eGlhb2d1YW5nLnhpbmdAc29waGdvLmNvbT4KPiA+ICsK
PiA+ICtkZXNjcmlwdGlvbjoKPiA+ICsgIFNvcGhnbyBTb0MtYmFzZWQgYm9hcmRzCj4gPiArCj4g
PiArcHJvcGVydGllczoKPiA+ICsgICRub2RlbmFtZToKPiA+ICsgICAgY29uc3Q6ICcvJwo+ID4g
KyAgY29tcGF0aWJsZToKPiA+ICsgICAgb25lT2Y6Cj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsg
ICAgICAgICAgLSBlbnVtOgo+ID4gKyAgICAgICAgICAgICAgLSBtaWxrdixwaW9uZWVyCj4gPiAr
ICAgICAgICAgIC0gY29uc3Q6IHNvcGhnbyxzZzIwNDIKPiA+ICsKPiA+ICthZGRpdGlvbmFsUHJv
cGVydGllczogdHJ1ZQo+ID4gKwo+ID4gKy4uLgo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMKPiA+IGluZGV4IDkwZjEzMjgxZDI5Ny4uYjc0ZDUwNTAwM2UyIDEwMDY0
NAo+ID4gLS0tIGEvTUFJTlRBSU5FUlMKPiA+ICsrKyBiL01BSU5UQUlORVJTCj4gPiBAQCAtMjAw
NjMsNiArMjAwNjMsMTMgQEAgRjogICBkcml2ZXJzL2NoYXIvc29ueXBpLmMKPiA+ICBGOiAgIGRy
aXZlcnMvcGxhdGZvcm0veDg2L3NvbnktbGFwdG9wLmMKPiA+ICBGOiAgIGluY2x1ZGUvbGludXgv
c29ueS1sYXB0b3AuaAo+ID4KPiA+ICtTT1BIR08gREVWSUNFVFJFRVMKPiA+ICtNOiAgIFhpYW9n
dWFuZyBYaW5nIDx4aWFvZ3VhbmcueGluZ0Bzb3BoZ28uY29tPgo+ID4gK006ICAgQ2hhbyBXZWkg
PGNoYW8ud2VpQHNvcGhnby5jb20+Cj4gPiArUzogICBNYWludGFpbmVkCj4gPiArRjogICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwKPgo+ID4gK0Y6
ICAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vCj4KPiBGaXJzdGx5LCB0aGlzIGRpcmVjdG9y
eSBkb2VzIG5vdCBleGlzdCBhdCB0aGUgdGltZSBvZiB0aGlzIHBhdGNoLCBzbyBpdAo+IHNob3Vs
ZCBub3QgYmUgYWRkZWQgaGVyZSwgYnV0IHJhdGhlciBhdCB0aGUgdGltZSB0aGF0IHlvdSBjcmVh
dGUgaXQuCj4KPiBTZWNvbmRseSwgYXJlIFhpYW9ndWFuZyBYaW5nIGFuZCBDaGFvIFdlaSBnb2lu
ZyB0byBtb25pdG9yIHRoZSBsaXN0cyAmCj4gYXBwbHkgcGF0Y2hlcyBmb3IgdGhlc2UgZmlsZXM/
IElmIHNvLCB5b3Ugc2hvdWxkIGFkZCBhIGdpdCB0cmVlIGhlcmUKPiB0aGF0IHRoZXkgd2lsbCBh
cHBseSBwYXRjaGVzIHRvICYgYWRkIHRvIGxpbnV4LW5leHQuIEFsc28sIEknZCByZWFsbHkKPiBs
aWtlIHRvIHNlZSBzb21lIG9uLWxpc3Qgc2lnbnMgb2YgbGlmZSBmcm9tIHRoZXNlIHBlb3BsZSwg
b3RoZXJ3aXNlCj4gSSdkIHJhdGhlciBzZWUgeW91ciBuYW1lIGhlcmUgaW5zdGVhZCBvZiB0aGVp
cnMuCj4KPiBJZiB0aGV5IGRvbid0IGludGVuZCByZXZpZXdpbmcvdGVzdGluZy9hcHBseWluZyBw
YXRjaGVzLCBJIGNhbiBkbyBpdCBhcwo+IGEgbGFzdCByZXNvcnQgYnV0IEkgd291bGQgcmF0aGVy
IHRoYXQgc29tZW9uZSB3aG8gc3BlY2lmaWNhbGx5IGNhcmVzIGZvcgo+IHRoaXMgaGFyZHdhcmUg
ZG9lcyBpdC4KPgo+IFRoYW5rcywKPiBDb25vci4KPgoKSGksIENvbm9yOgpQbGVhc2UgYWxsb3cg
bWUgdG8gZXhwbGFpbiBmaXJzdC4gQXMgYSBjb21tdW5pdHkgdm9sdW50ZWVyLCBJIGFjdHVhbGx5
CmhhZCBmdWxsIGRpc2N1c3Npb25zIGFuZCB0ZXN0aW5nIHdpdGggU29waGdvIHBlb3BsZSB3aGVu
IHN1Ym1pdHRpbmcKcGF0Y2hlcywgc28gSSBhZGRlZCB0YWcgc3VjaCAiQWNrZWQtYnk6IFhpYW9n
dWFuZyBYaW5nIC4uLiIgdG8gdGhlCnNpZ25hdHVyZSBwYXJ0IG9mIG1vc3QgcGF0Y2hlcy4gQWxz
byBpZiB5b3UgdGhpbmsgYSBmb3JtYWwgZW1haWwgaXMKcmVxdWlyZWQsIEkgd2lsbCB0YWxrIHRo
ZW0gdG8gc2VuZCBpdC4KCkFzIGZvciB0aGUgaXNzdWUgb2YgTUFJTlRBSU5FUlMsIEkgZGlzY3Vz
c2VkIGl0IHdpdGggdGhlIHBlb3BsZSBmcm9tClNvcGhnby4gVGhleSAoaW5jbHVkaW5nIG1lIGFs
c28pIGZlZWwgdGhhdCB3ZSBhcmUgbm90IHZlcnkgZmFtaWxpYXIKd2l0aCB0aGUgY29tbXVuaXR5
IHByb2Nlc3MgKGVzcGVjaWFsbHkgYXMgbWFpbnRhaW5lciwgYW5kIGFjdHVhbGx5IEkKbW9kaWZ5
IHRoZSBmaWxlIE1BSU5UQUlORVJTIGlzIGp1c3QgdG8gc3VwcHJlc3Mgd2FybmluZyBpbmZvcm1h
dGlvbgp3aGVuIHJ1bm5pbmcgY2hlY2twYXRjaC5wbCksIHNvIHdlIHNpbmNlcmVseSBob3BlIHRv
IGludml0ZSB5b3UsIE1yLgpDb25vciwgdG8gaGVscCB1cyBmb3IgYSBwZXJpb2Qgb2YgdGltZSBv
biBtYWludGVuYW5jZSB3b3JrLCBpbmNsdWRpbmcKY2hlY2tpbmcgcmVsZXZhbnQgcGF0Y2hlcywg
bWVyZ2luZyBhbmQgc3VibWl0dGluZyBQUnMsIHdlIHdpbGwgbGVhcm4KdG9nZXRoZXIgd2l0aCB5
b3UgZm9yIGEgd2hpbGUsIGFuZCB0aGVuIHRha2Ugb3ZlciB0aGlzIHBhcnQgb2YgdGhlCndvcmsg
d2hlbiB3ZSBiZWNvbWUgZmFtaWxpYXIgd2l0aCBpdC4gV2Uga25vdyB0aGF0IHlvdSBhcmUgYWxz
byB2ZXJ5CmJ1c3kgYXQgd29yaywgZXNwZWNpYWxseSBpZiB5b3UgZG9uJ3QgaGF2ZSB0aGUgaGFy
ZHdhcmUgYXQgaGFuZC4gSQpoYXZlIHRoZSBoYXJkd2FyZSBoZXJlIGFuZCBJIGNhbiB0YWtlIHRo
ZSByZXNwb25zaWJpbGl0eSB0byBydW4KdGVzdGluZy4gV2hhdCBkbyB5b3UgdGhpbms/IEknbSB3
YWl0aW5nIGZvciB5b3VyIHJlcGx5LiBUaGFua3MgaW4KYWR2YW5jZS4KCj4gPiArCj4gPiAgU09V
TkQKPiA+ICBNOiAgIEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+Cj4gPiAgTTogICBU
YWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuY29tPgo+ID4gLS0KPiA+IDIuMjUuMQo+ID4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
