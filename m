Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779DECD8CAC
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BmB/3VXYy6VzX0thRvCnKZCM+dKsQwfODDiArD/pbo=; b=iFJ0LfVn7e4RQM
	pEKNGnJupWMWN4f/m4YdV/F0he1tm0TGNTTom/dex6lqm7ViwTvffRrM1E2Uu2Y4ZhRKHQRix6Bss
	Yth02TM9XQVTX+A2pXL5c2DuxV2V/lgJRhMk6dGJMjHgffWpslhxdfBBYOwSWbyhhhKILVijkvN3d
	mtx0pmFrnkZfjxf+uBQtD7ldtbPoM6rjZM9Lq3x6A/8q8wrOZrGcUgVazkm94+PZc505Yz9DqesHO
	tIs4gpS68FFT8WHdsx31DgrvjlM31VaNIKWaqlvs7NgHhquOD4W+vBpoLKLlujK1jLEsDFmDBybX1
	DndOUT6+uWLvECXFXoOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrPW-000000051LQ-1qqb;
	Tue, 09 Jun 2026 08:02:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrPT-000000051L3-3ocr
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 08:02:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597refI2034810
	for <linux-riscv@lists.infradead.org>; Tue, 9 Jun 2026 08:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ppbxYWmUe+n14dBjJKXE7EunGdgOizVvORmJjhi9sIQ=; b=L4
	6jW91n3danqpMZpLno/pXbgGWSanIfmO9hon068Tpnm9qha7YtcdgtUzxQJoyeYg
	RWTBu5aL53Flz1LEpv5Rygv6Q2Ra30dpOwmmC2GHNZ1pb/hVJCVKGKbhKYN0RNra
	CUenh4IG4t2Fe+PdEeZ1oZZ3R1Ve2CtA/UVCtAYCrbsuuoI2FmP/S+7rdgETGz/j
	7KksS3/qVrZX8vSzYARaeFDUe3TgFThzKaUGNMWM2DJOCJUOD6PyC3W+h0x6cgPj
	hE9I05HmCv/r0kpqpEb9uvq81wreomdAmQZhnkgVanDQ3qc4qw6tGaLprPO7dZXB
	U6X/A5CsUnA3KoCQID7g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeear4pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 08:02:06 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7e96dad7730so111766497b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 01:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780992126; cv=none;
        d=google.com; s=arc-20240605;
        b=kLnTHN2fsqZDnANqxq/ZKFnQ5sjTFg+LURUSlIMUYZ10lROkVcMnluhD/EBzwmlr/2
         lAN5IlkCdE3c4y9JC/xq+dF6kdTe0gLd4T4BGvVL+Qo11DncFkrcSbib1aZYrlgu0S2+
         Eq5hC+ZLg5HD7jElNSXu+DWynzw/XWKe2B/5PKvz/7VOEmj34mTudaxRh/TFZpKXdf/I
         kFLHcW20fzaAFmaVgTUD6NvVN+u5eRPo0Mfw6KWXdi/CyRmrEyBybamPl3lHeDeHozUd
         cQyiLX54gFG05CHr9QEklQMjPfxv/vu6AfLUI/uQB0SPI2k4bM9gNG9YhvafL8xbWRca
         JFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=ppbxYWmUe+n14dBjJKXE7EunGdgOizVvORmJjhi9sIQ=;
        fh=JPBs0T0mqs7AduWVQZ+nKlQm2WT+U42QM4etRF6cFkc=;
        b=T1ZFzVbvPJ6IQEc/wkAV/fwIPAu8kbBi9QfT7JmQyglxjoBD7Y0uOEADVhjo6C8L0C
         cYX2dt5aJ3lJjtZbXRzxe69uAf79m3p605mdwKFespu9vrJelXHbLS8vX3FgtTES2aHp
         Nbc9xMwO02sLu16tzQqAVPNZuDBHIjKCUdiZ+fVPRCBOKiipiyBo6NKzvjkpYvrXfc08
         dLk4sGFXvI69znYji4YRHeRYlC0S2F2Wpq1oMWw7WAzTbiG8qdWxJWvfldHUHJ5aShqX
         gNw6lKaC/7o2D5ClEa/oD30wQ7rtD9OOV8MZ/mk9P7h2vWk2/45Ek3zp2klgnGfsA5u3
         /2aw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992126; x=1781596926; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ppbxYWmUe+n14dBjJKXE7EunGdgOizVvORmJjhi9sIQ=;
        b=DASIEm6jswLprvDDaItdX1iTJfqy9CRJBLYTN42jEAkb11oT/WQNLRhjJChguPSmlU
         MnVjHhMNbOaoit1soc/PUwozzxQQBJEXzhDF6LPgq00pYvxeVxL5HCQl7n5TXOsB7eMK
         S5tCGkJvrDvhkdg8aXhAOukvT1qVqiFUWxfHctTGvXTFFCEQ3WUQZmU2PgBrlCFaJflM
         jcpTi+/K2LluVHpv5jzrFrSxYKUfP5T6lAMbGSnCpRQTa0nA5r1On+k6SrL1P3RfQNob
         h5tHgsVQBkwo0/rnijKLJ6RQXVl/G1CmePqknP4PR/bR1ePTD3wke2IaY5FU05pWyBo/
         rBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992126; x=1781596926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppbxYWmUe+n14dBjJKXE7EunGdgOizVvORmJjhi9sIQ=;
        b=jc5takztlWAjVPHZPgkuGn2EB7XPRNA8d+ChNkclXlKSfT/+fH7Rxm8fOqZy9ChS9P
         YQ4473KCAhXKAHG+BZ4WqgcsSOeFnIBeBRiNduxMkYb5D+gA13CPX9qcrPISBN957eoK
         zlL97pDxMJGzGyVZdSXaTnxV8fnMUSh6XZpjH24BMfMBH4YpX1E8vUiMPsVCkHSMc9XV
         wXAj73z0onX9gRVYDBmSu3mAh4/I2qA8FOmpTJOAsV9Xuce1sJUJUMAln/CbHw7sW1DS
         IqT4x2Cbb9TbhfI3VeH4IFf2auUjvO84nrwFpQe35xyvWKyTpxm3Rj8MJ4QWUhVH4jX5
         qlMQ==
X-Gm-Message-State: AOJu0Yz2XDWNLVy0VEuJ9dexhxlT5lOS+RkE1sMUx5t4tVLHD9W+Bujz
	NthE680XJXlAS/Nh/yGHXFvvtkPkrLqhLQCf1tLlZ7C1YBlhRYsdLEac3vyuI6PbuFtGL3/i5xW
	HpATOp72XJOZBiOPzpfGwwlU5kYmvYgfpOyIjKQF1H1mpU5Yuon8H+nDPNsFDMdGYZVRvUvDwcU
	RlsRcXZx/Vsh230KujhS0kYDVknhftXUB8+iZa2p2ALy4zbw==
X-Gm-Gg: Acq92OEsF3A32oPaZ45vX6HGeiJFOZhZUurqMvIxkzOEVsemukKYRVuBlefuAjontKZ
	HdYPBbdYnc4ACwmjiPCwFhZ077jeo7lVIjsjm+1LEdeQbL/nWgvQDeMcAo8hsem0otVUkkikEWw
	sZ82dlmV5CX0kfk1bswu/oa/m0Q59ethtcaP7Yl5CGyRybFw7rbu6Fk5Jm8QZwyEz13G8cWBsV8
	cbbnLrPrnLiW4EKoA==
X-Received: by 2002:a05:690e:4144:b0:660:a653:4495 with SMTP id 956f58d0204a3-66106e01386mr16440739d50.4.1780992126059;
        Tue, 09 Jun 2026 01:02:06 -0700 (PDT)
X-Received: by 2002:a05:690e:4144:b0:660:a653:4495 with SMTP id
 956f58d0204a3-66106e01386mr16440721d50.4.1780992125662; Tue, 09 Jun 2026
 01:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com> <20260513084325.2176952-3-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260513084325.2176952-3-himanshu.chauhan@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 13:31:54 +0530
X-Gm-Features: AVVi8Cdab09nLFiWsiig7vANHBJNBVR0v6HSRzUvHph-SxzBxVhm2UenvmNafPY
Message-ID: <CAB19ukExADA6W1pXDqVdA13BGLrtbG1nkfNKVwKyCd4yrNtdMg@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] riscv: Define arch_apei_get_mem_attribute for RISC-V
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com,
        anup.patel@oss.qualcomm.com
X-Proofpoint-ORIG-GUID: UV-ItnEQAlQPnOXKI01hONTx0wi-zW5D
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27c87e cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=lDU5pCILgqd7k7drH44A:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NSBTYWx0ZWRfXy3rEIdKBWbcN
 i0ioEfU0OvLOubt6/GOOj1fT1BcZ6jjpkfI6PTAXqZtPeaCu0OyiUw06HYuOKaCyhvoUCcA8hbO
 wMMdB56giRkGZNPopISIjLb8S61YbRnPzVkQEk47mBUmQrfo3OhfDbJxG4ZcIvzdofRhxGPyjv7
 6MkCrwz/iekQ140t3HKLwLLf1+jIlQroeTR+CcVqd2DCWzbzKyyrXbSua5RHON4jGQWVoMpZHMz
 8uf4DDb2BMlw3jcT0/jnKje+SLKBMhxuSCsik4ukYphzv+MhvWRE97c83dvX6U5lZHJJRbvRoLA
 G19i3lk/Vg12xoY/AuGGpjj9XFioHh/Vaeu3vj9CWt1hsl45bFiRTq7TByTtR6U61fu7XWF0oPK
 hEoA1Csxxpz7ViIAskz2ZWHXBqmYexXZl+aty9YJwKU9BYLeiLMl+nuqB2ieNyjSLMsH0OUf6Y6
 NcujF9S0iDrMy7JKC8Q==
X-Proofpoint-GUID: UV-ItnEQAlQPnOXKI01hONTx0wi-zW5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_010208_069328_266AA012 
X-CRM114-Status: GOOD (  21.90  )
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
Reply-To: sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMjoxM+KAr1BNIEhpbWFuc2h1IENoYXVoYW4KPGhpbWFu
c2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBnaGVzX21hcCBmdW5jdGlv
biB1c2VzIGFyY2hfYXBlaV9nZXRfbWVtX2F0dHJpYnV0ZSB0byBnZXQgdGhlCj4gcHJvdGVjdGlv
biBiaXRzIGZvciBhIGdpdmVuIHBoeXNpY2FsIGFkZHJlc3MuIFRoZXNlIHByb3RlY3Rpb24KPiBi
aXRzIGFyZSB0aGVuIHVzZWQgdG8gbWFwIHRoZSBwaHlzaWNhbCBhZGRyZXNzLgo+Cj4gU2lnbmVk
LW9mZi1ieTogSGltYW5zaHUgQ2hhdWhhbiA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVhbGNvbW0u
Y29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaCB8IDE2ICsrKysrKysr
KysrKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jICAgICAgfCAxMiArKysrKysrKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hY3BpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Fj
cGkuaAo+IGluZGV4IDI2YWIzN2MxNzFiYy4uYzE0MmRiOWY4MWE3IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vYWNwaS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9hY3BpLmgKPiBAQCAtMTQsNiArMTQsNyBAQAo+Cj4gIC8qIEJhc2ljIGNvbmZpZ3VyYXRpb24g
Zm9yIEFDUEkgKi8KPiAgI2lmZGVmIENPTkZJR19BQ1BJCj4gK3BncHJvdF90IF9fYWNwaV9nZXRf
bWVtX2F0dHJpYnV0ZShwaHlzX2FkZHJfdCBhZGRyKTsKPgo+ICB0eXBlZGVmIHU2NCBwaHlzX2Nw
dWlkX3Q7Cj4gICNkZWZpbmUgUEhZU19DUFVJRF9JTlZBTElEIElOVkFMSURfSEFSVElECj4gQEAg
LTI3LDYgKzI4LDIxIEBAIGV4dGVybiBpbnQgYWNwaV9kaXNhYmxlZDsKPiAgZXh0ZXJuIGludCBh
Y3BpX25vaXJxOwo+ICBleHRlcm4gaW50IGFjcGlfcGNpX2Rpc2FibGVkOwo+Cj4gKyNpZmRlZiBD
T05GSUdfQUNQSV9BUEVJCj4gKy8qCj4gKyAqIGFjcGlfZGlzYWJsZV9jbWNmZiB0byBkaXNhYmxl
IElBLTMyIENvcnJlY3RlZCBNYWNoaW5lIENoZWNrIChDTUMpCj4gKyAqIEZpcm13YXJlLUZpcnN0
IG1vZGUuIEl0IGlzIG5vdCByZXF1aXJlZCBpbiBSSVNDLVYgYXJjaGl0ZWN0dXJlCj4gKyAqIGFu
ZCBpcyBwcmVzZW50IGZvciBjb21wYXRpYmlsaXR5Cj4gKyAqLwo+ICsjZGVmaW5lIGFjcGlfZGlz
YWJsZV9jbWNmZiAxCj4gK3N0YXRpYyBpbmxpbmUgcGdwcm90X3QgYXJjaF9hcGVpX2dldF9tZW1f
YXR0cmlidXRlKHBoeXNfYWRkcl90IGFkZHIpCj4gK3sKPiArICAgICAgIHJldHVybiAgX19hY3Bp
X2dldF9tZW1fYXR0cmlidXRlKGFkZHIpOwo+ICt9Cj4gKyNlbHNlIC8qIENPTkZJR19BQ1BJX0FQ
RUkgKi8KPiArI2RlZmluZSBhY3BpX2Rpc2FibGVfY21jZmYgMAo+ICsjZW5kaWYgLyogIUNPTkZJ
R19BQ1BJX0FQRUkgKi8KPiArCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBkaXNhYmxlX2FjcGkodm9p
ZCkKPiAgewo+ICAgICAgICAgYWNwaV9kaXNhYmxlZCA9IDE7Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL2FjcGkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+IGluZGV4IDA2
OGUwYjQwNGI2Zi4uN2E2NzcwNjk3OTk5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L2FjcGkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+IEBAIC0yMDQsNiArMjA0
LDE4IEBAIHN0cnVjdCBhY3BpX21hZHRfcmludGMgKmFjcGlfY3B1X2dldF9tYWR0X3JpbnRjKGlu
dCBjcHUpCj4gICAgICAgICByZXR1cm4gJmNwdV9tYWR0X3JpbnRjW2NwdV07Cj4gIH0KPgo+ICtw
Z3Byb3RfdCBfX2FjcGlfZ2V0X21lbV9hdHRyaWJ1dGUocGh5c19hZGRyX3QgYWRkcikKPiArewo+
ICsgICAgICAgdTY0IGF0dHI7Cj4gKwo+ICsgICAgICAgYXR0ciA9IGVmaV9tZW1fYXR0cmlidXRl
cyhhZGRyKTsKPiArICAgICAgIGlmIChhdHRyICYgRUZJX01FTU9SWV9XQikKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIFBBR0VfS0VSTkVMOwo+ICsgICAgICAgaWYgKChhdHRyICYgRUZJX01FTU9S
WV9XQykgfHwgKGF0dHIgJiBFRklfTUVNT1JZX1dUKSkKPiArICAgICAgICAgICAgICAgcmV0dXJu
IHBncHJvdF93cml0ZWNvbWJpbmUoUEFHRV9LRVJORUwpOwo+ICsgICAgICAgcmV0dXJuIFBBR0Vf
S0VSTkVMOwo+ICt9Cj4gKwo+ICAvKgo+ICAgKiBfX2FjcGlfbWFwX3RhYmxlKCkgd2lsbCBiZSBj
YWxsZWQgYmVmb3JlIHBhZ2luZ19pbml0KCksIHNvIGVhcmx5X2lvcmVtYXAoKQo+ICAgKiBvciBl
YXJseV9tZW1yZW1hcCgpIHNob3VsZCBiZSBjYWxsZWQgaGVyZSB0byBmb3IgQUNQSSB0YWJsZSBt
YXBwaW5nLgo+ClJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAb3NzLnF1YWxjb21tLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
