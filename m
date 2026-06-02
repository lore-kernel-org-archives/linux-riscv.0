Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386FACD6E57
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jb9I1ZUIYem77V6GXDX7f5IU1KxzvgSBMAUwXZDxDnU=; b=4F2l12FnfcSGZH
	+SpUrhkNWCy5TmsaieuXB7IiuY5XecUw+gbMhSydIOD5fIAMIpnVw3sr7nnWFgjiTpuOvt52e0lor
	tJFE2aoVpOtpjaSEN+Nz2O9PIYmXEYEczeSPz+snPC/Fi8cKl0zmbJAyg5bsFeQtidpUqilWQQiI1
	5Ar0i1eGIn2NEb0UHpCp6quiaKIYeF7K4Hog3DjmGMLZrLLWSK53GTFx4TgQiHaqggfqhtxDTxtOl
	UpjVitgJ6tGgWbKZrnWTqLMmzxviybDFJLc3zhO/PAQfA5PVbTo9VAn851s0qDH0N4ZPg0QpM1Grh
	2yf2jnv4ABgyHOYIYjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNJh-0000000CsNf-3DeP;
	Tue, 02 Jun 2026 11:29:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNJf-0000000CsMz-13xH
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 11:29:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6529UYWw3355383
	for <linux-riscv@lists.infradead.org>; Tue, 2 Jun 2026 11:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gfkLtAqu3R3WTJ5a9dV0MD9n3KII7DwVLMftGaDRPfg=; b=XDB2l32SzQ9daz68
	lxK5Xb7sg5EPmKGeeUGvcrv/6XXu121X4Ttntxy7hI/bBl7JJF/Up3NSQdbhuGmH
	aljIgYDBEn04ouvnNPxX1ZRbWTTdE5Y8c/V2DEAWLlVVg1cH7wwtGXEMOQvce18m
	RqxZPzFzON2c9Hv5SSzxERsKkqWyRblaqvGnV8qQ3qurhHPXyIJkFniB0Sp4U+zW
	r0ODyUwfxnTwV+eZZw/dvUufH546GrfLnEAZqS2nOn0pyOe+0+nEn8aVUHV/AiVb
	SVBzY1LqZTeoqvUItYFfbyL4+s0buLS8rxAJ9XSI1RE8aYxN/g1vY+Mz4SEu9x9Y
	qC7E4Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehvkx8cgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 11:29:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccf62978bfso73466986d6.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 04:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780399789; cv=none;
        d=google.com; s=arc-20240605;
        b=gYi/ZwXJ+E7YxZ9ecAHvQt2fl/4AGc6wXbGORuPUIwwQ055g7ad0CzSI8mKa2jr2yp
         JbfqQiu2Rt+wBto1lfWERw/Dg4RteXMciG5yoicyhpAQV9RCBoMpr/G5F91ikrVl43wU
         WfrcNjAc7uVuDSWetTOz1x/+eWDcF1CL/BBS9xJKgTP+uyCtXDXmjRIjshvhW2bFPTkt
         3Edw49aJlmdke/emk65WmuXEWnd7Pg6d+fTXVdrKJenif5MFgkfoVmzcdnYCtjn6MkVK
         58ib54Xzzd7A/+tG/sv9PzbFtz9paSPfB9egzf7vcqDqIKEewIywaoMcDKt82W/5xdZL
         xXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gfkLtAqu3R3WTJ5a9dV0MD9n3KII7DwVLMftGaDRPfg=;
        fh=/rVjc/j2PmNS8WJn8C50p2T4MpFpQMg6/uHp5RgQ3QM=;
        b=k9BF4fkEUl83mdQOI/GG/H6Qz8GCGP+sLWI2iExSzFPMj9OY8H8Kmt44EsfOlkuFDA
         6JNoUPKeCVloTNWpnW1Wy2p7eCz6m45/w/LXCvSDyAsrvFoIbTdWaNt5Q3QjnluNkjre
         Jg6Swv+DnYxKUFRhd2HiGl40PnKMTHNxWkRPxn30H7mmc1VBexZlfa/Fmu2SCdb5Stsf
         8OH0LfZG8nH/rc2NtXtCzsZcMK/9ZP35ZPvuHvXwOJGtt2vk5dVADPHqGvSRYQVMbQtk
         V7z4mQ1q2h/dZmGJKE9iyr544EqZyegsx+AXw9szqAJPPR0FC09gdUyGBANPaTuq96V6
         zDRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780399789; x=1781004589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfkLtAqu3R3WTJ5a9dV0MD9n3KII7DwVLMftGaDRPfg=;
        b=CVYG1m5E9X9oy0gpJ7Ca9GpfsGrq4zBdRV2yxUrDTot1OfwQ+xKA67wIJbeROTtaCr
         JhMlGPNRet9oSPsUQN+Luq0/wxD5Y6v2skKO4m+Ah7GWvt3sXomPTeL0sD2db0CQSiYu
         8fLam5aXFtCsrdzsEInO38yvFz6DSicrBrvR0w3WWQblQpB65YuyyVsJ0ZnyzJgJWFKG
         g/Zz8kelkRB+gnZqBxnOS5QO4X+ZcuMWTTNCSEi+J5K1U4i2aUZJrPJ0xWhpnE+BmE28
         9FxniKZtAcTaG3QCsee3Fu7k3q+wRD1B7vHn4cT8yrLuTSNsRC2oEbS36RykljGJ16S3
         U0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399789; x=1781004589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gfkLtAqu3R3WTJ5a9dV0MD9n3KII7DwVLMftGaDRPfg=;
        b=byg7CQo81N4u8Wo/ary+Hb4C2rR2ia2ymSFosT+WXgKgbFiGskblqqaTWz6KOnM1H4
         aV8x0gbNt3tV92Rf+Yf3NwWW1ryyoxznb2eNMaBlUjrXoKdlqMeB8sEZypzumeyLZTfW
         JBlQFSANdD1SNz1YnDirjLGNYeJpqskkkoR2cdbiBO0HgjVSUKmwsbF4ecH0wylWQgK3
         prhhsmy4eVzCK/tWIMlgDRB2wRx5GVnp3jzuGW5sOW2DeoOZqYLk55DYwnVHaK39PR3U
         oQP4XuY2OslsyaO1WaovaiJAvikDLt86TC+yk+8Do5HOnpL2MW+k0M21QlCdOkc606Gt
         DjDg==
X-Forwarded-Encrypted: i=1; AFNElJ8nh8v7cFK+Y9iwXNFsdWxxD2QthUL2B6y3xyuOX1RKN/2tZzY7G9KCWK6hKWajKN9PASyq8xPvlNMgBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDpIbu5pHIHjMdG37NvpUViACuea6f3vnpwgb3zxw46UoVSg++
	Kmg0rDt/UqiQz6HRcIA6DMMASLvI6iymWnHyZmvsjaxArkFVavcTCds7QlVvanaKbNko/yGmgDk
	Rva72jEPwywe9mj50RNDIncEWJSJC8DsdcQfEzxUaHaXRR+5WTWzi4+zV39h9cFO0J/jdhzxQx2
	JULE1rJdXhMftvWCSzgn0aghqrdF0xJGPjWuA71l7ZTg3WqA==
X-Gm-Gg: Acq92OGMgzZ2jdwDQbhV76A32AHoVmoSehHCAQiAG1/v1trnJqLzLikbsVEp5GXgwVO
	dQWCYG9PFXHLTQl3RZQSYonG5tox0FZsz560/L7fELl1MCiMFKQ4HlvfOivYvTXBfTesqlK6m0S
	ODvLgMg8eLo7K/lA0Gv0o1lRsuIIeRpbq5cDCWU+2GkYTE/7gOKFS3lLE+rPu7PldSkz7ZgS/wI
	bdM6YqDoeq0hLgFxA==
X-Received: by 2002:a05:6214:c6b:b0:89c:806c:93 with SMTP id 6a1803df08f44-8ccefd8d38cmr259361346d6.30.1780399789239;
        Tue, 02 Jun 2026 04:29:49 -0700 (PDT)
X-Received: by 2002:a05:6214:c6b:b0:89c:806c:93 with SMTP id
 6a1803df08f44-8ccefd8d38cmr259360756d6.30.1780399788759; Tue, 02 Jun 2026
 04:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-6-anup.patel@oss.qualcomm.com> <ahCkjH-sGnGLHpG-@curiosity>
In-Reply-To: <ahCkjH-sGnGLHpG-@curiosity>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 16:59:36 +0530
X-Gm-Features: AVHnY4IPvjpxjhX4kMF8xfCjcDhv0xi6uud59IHB2ghj0dRQmrdcUVsc6DXwyiU
Message-ID: <CAHuiULB4PKngzUYg65gj3k+OeKnUXL6NQQmwm3697Uq3Fijknw@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] rvtrace: Add trace encoder driver
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Proofpoint-ORIG-GUID: 44QDI_dvmAI4ZLQFMN0E0Utr8uW4063V
X-Authority-Analysis: v=2.4 cv=GYknWwXL c=1 sm=1 tr=0 ts=6a1ebead cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Wa9ct739lkgR9Ah4pj4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 44QDI_dvmAI4ZLQFMN0E0Utr8uW4063V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEwOSBTYWx0ZWRfX33Dgr3GOdxud
 94hfEdLsmYcnNCklJldA0d9dT8oiIXU9uOI+Qh58zD/C88mMLzHzBc9Bzwk8qjOoW1SUwUI7PET
 vj6yfHEmg2bgxreswPFOFhlQeuZFgHMOLFz1byqPTkjaw4jHVhJHKZ1ZhFpHvuGj4/tNtumB1Hs
 Rvh60vlLI5QJZwMCT0wyhez7mlPhMmrDWSzAAjNedOZahHT5mmcfWIIeMDm5U/BuwxrgOZe5gD6
 ri7wvYdZVY8/ob+HJKZg93OryD2AW80XKRuK+g2MFWGCZjsZVKQcObUdU1cv2+Hfcva6LFth/Nv
 BO9mmS8Jv0vsphK4k0H+5/auSrkCERcl3WJhTVZKyprrQwQGisDeACkIvBaXlk+SMlrDKpKR/Xw
 65ytQsPnm32KTrfybWfgbGTCxzrgRvR4IeL4PabgGzbMu6Ll8MuazAHOHiBW/j8V/X8hcXsYH3y
 WIB7h4ZmMMByYZFKstg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_042951_413228_60F27D75 
X-CRM114-Status: GOOD (  21.65  )
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

SGkgU2VyZ2V5LAoKT24gU2F0LCBNYXkgMjMsIDIwMjYgYXQgMTI6MTbigK9BTSBTZXJnZXkgTWF0
eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+ID4gRnJvbTog
TWF5dXJlc2ggQ2hpdGFsZSA8bWF5dXJlc2guY2hpdGFsZUBvc3MucXVhbGNvbW0uY29tPgo+ID4K
PiA+IEFkZCBpbml0aWFsIGltcGxlbWVudGF0aW9uIG9mIFJJU0MtViB0cmFjZSBlbmNvZGVyIGRy
aXZlci4gVGhlIGVuY29kZXIKPiA+IGlzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBUcmFjZSBDb250
cm9sIEludGVyZmFjZSBzcGVjaWZpY2F0aW9uLgo+ID4KPiA+IENvLWRldmVsb3BlZC1ieTogQW51
cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
QW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogTWF5dXJlc2ggQ2hpdGFsZSA8bWF5dXJlc2guY2hpdGFsZUBvc3MucXVhbGNvbW0uY29tPgo+
ID4gLS0tCj4gPiAgZHJpdmVycy9od3RyYWNpbmcvcnZ0cmFjZS9LY29uZmlnICAgICAgICAgICB8
ICAgNyArKwo+ID4gIGRyaXZlcnMvaHd0cmFjaW5nL3J2dHJhY2UvTWFrZWZpbGUgICAgICAgICAg
fCAgIDEgKwo+ID4gIGRyaXZlcnMvaHd0cmFjaW5nL3J2dHJhY2UvcnZ0cmFjZS1lbmNvZGVyLmMg
fCAxMzAgKysrKysrKysrKysrKysrKysrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEzOCBpbnNl
cnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHd0cmFjaW5nL3J2dHJh
Y2UvcnZ0cmFjZS1lbmNvZGVyLmMKPgo+IC4uLgo+Cj4gPiArc3RhdGljIGludCBydnRyYWNlX2Vu
Y29kZXJfc3RhcnQoc3RydWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wKQo+ID4gK3sKPiA+ICsg
ICAgIGludCByZXQ7Cj4gPiArICAgICB1MzIgdmFsOwo+ID4gKwo+ID4gKyAgICAgdmFsID0gcnZ0
cmFjZV9yZWFkMzIoY29tcC0+cGRhdGEsIFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfT0ZGU0VUKTsK
PiA+ICsgICAgIHZhbCB8PSBCSVQoUlZUUkFDRV9DT01QT05FTlRfQ1RSTF9FTkFCTEVfU0hJRlQp
Owo+ID4gKyAgICAgcnZ0cmFjZV93cml0ZTMyKGNvbXAtPnBkYXRhLCB2YWwsIFJWVFJBQ0VfQ09N
UE9ORU5UX0NUUkxfT0ZGU0VUKTsKPiA+ICsgICAgIHJldCA9IHJ2dHJhY2VfcG9sbF9iaXQoY29t
cC0+cGRhdGEsIFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfT0ZGU0VULAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBSVlRSQUNFX0NPTVBPTkVOVF9DVFJMX0VOQUJMRV9TSElGVCwgMSwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcC0+cGRhdGEtPmNvbnRyb2xfcG9s
bF90aW1lb3V0X3VzZWNzKTsKPgo+IElJVUMgdGhlIGNvZGUgZnJhZ21lbnQgYWJvdmUgZHVwbGlj
YXRlcyAncnZ0cmFjZV9lbmFibGVfY29tcG9uZW50JyBmcm9tCj4gcnZ0cmFjZS1jb3JlLmMuCj4K
PiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAgICAgICAgZGV2X2VycigmY29tcC0+ZGV2
LCAiZmFpbGVkIHRvIGVuYWJsZSBlbmNvZGVyLlxuIik7Cj4gPiArICAgICAgICAgICAgIHJldHVy
biByZXQ7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICAvKiBzZXQgbW9kZSAqLwo+ID4gKyAg
ICAgdmFsID0gcnZ0cmFjZV9yZWFkMzIoY29tcC0+cGRhdGEsIFJWVFJBQ0VfQ09NUE9ORU5UX0NU
UkxfT0ZGU0VUKTsKPiA+ICsgICAgIHZhbCB8PSAoUlZUUkFDRV9DT01QT05FTlRfQ1RSTF9JTlNU
TU9ERV9PUElUIDw8IFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfSU5TVE1PREVfU0hJRlQpOwo+ID4g
KyAgICAgcnZ0cmFjZV93cml0ZTMyKGNvbXAtPnBkYXRhLCB2YWwsIFJWVFJBQ0VfQ09NUE9ORU5U
X0NUUkxfT0ZGU0VUKTsKPiA+ICsKPiA+ICsgICAgIHZhbCA9IHJ2dHJhY2VfcmVhZDMyKGNvbXAt
PnBkYXRhLCBSVlRSQUNFX0NPTVBPTkVOVF9DVFJMX09GRlNFVCk7Cj4gPiArICAgICB2YWwgfD0g
QklUKFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfSVRSQUNFX1NISUZUKTsKPiA+ICsgICAgIHJ2dHJh
Y2Vfd3JpdGUzMihjb21wLT5wZGF0YSwgdmFsLCBSVlRSQUNFX0NPTVBPTkVOVF9DVFJMX09GRlNF
VCk7Cj4gPiArICAgICByZXQgPSBydnRyYWNlX3BvbGxfYml0KGNvbXAtPnBkYXRhLCBSVlRSQUNF
X0NPTVBPTkVOVF9DVFJMX09GRlNFVCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
UlZUUkFDRV9DT01QT05FTlRfQ1RSTF9JVFJBQ0VfU0hJRlQsIDEsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXAtPnBkYXRhLT5jb250cm9sX3BvbGxfdGltZW91dF91c2Vjcyk7
Cj4gPiArICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKCZjb21wLT5kZXYs
ICJmYWlsZWQgdG8gZW5hYmxlIHRyYWNpbmcuXG4iKTsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBy
ZXQ7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgcnZ0cmFjZV9lbmNvZGVyX3N0b3Aoc3Ry
dWN0IHJ2dHJhY2VfY29tcG9uZW50ICpjb21wKQo+ID4gK3sKPiA+ICsgICAgIGludCByZXQ7Cj4g
PiArICAgICB1MzIgdmFsOwo+ID4gKwo+ID4gKyAgICAgdmFsID0gcnZ0cmFjZV9yZWFkMzIoY29t
cC0+cGRhdGEsIFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfT0ZGU0VUKTsKPiA+ICsgICAgIHZhbCAm
PSB+QklUKFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfSVRSQUNFX1NISUZUKTsKPiA+ICsgICAgIHJ2
dHJhY2Vfd3JpdGUzMihjb21wLT5wZGF0YSwgdmFsLCBSVlRSQUNFX0NPTVBPTkVOVF9DVFJMX09G
RlNFVCk7Cj4gPiArICAgICByZXQgPSBydnRyYWNlX3BvbGxfYml0KGNvbXAtPnBkYXRhLCBSVlRS
QUNFX0NPTVBPTkVOVF9DVFJMX09GRlNFVCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUlZUUkFDRV9DT01QT05FTlRfQ1RSTF9JVFJBQ0VfU0hJRlQsIDAsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXAtPnBkYXRhLT5jb250cm9sX3BvbGxfdGltZW91dF91c2Vj
cyk7Cj4gPiArICAgICBpZiAocmV0KSB7Cj4gPiArICAgICAgICAgICAgIGRldl9lcnIoJmNvbXAt
PmRldiwgImZhaWxlZCB0byBzdG9wIHRyYWNpbmcuXG4iKTsKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIHZhbCA9IHJ2dHJhY2VfcmVhZDMy
KGNvbXAtPnBkYXRhLCBSVlRSQUNFX0NPTVBPTkVOVF9DVFJMX09GRlNFVCk7Cj4gPiArICAgICB2
YWwgJj0gfkJJVChSVlRSQUNFX0NPTVBPTkVOVF9DVFJMX0VOQUJMRV9TSElGVCk7Cj4gPiArICAg
ICBydnRyYWNlX3dyaXRlMzIoY29tcC0+cGRhdGEsIHZhbCwgUlZUUkFDRV9DT01QT05FTlRfQ1RS
TF9PRkZTRVQpOwo+ID4gKyAgICAgcmV0ID0gcnZ0cmFjZV9wb2xsX2JpdChjb21wLT5wZGF0YSwg
UlZUUkFDRV9DT01QT05FTlRfQ1RSTF9PRkZTRVQsCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFJWVFJBQ0VfQ09NUE9ORU5UX0NUUkxfRU5BQkxFX1NISUZULCAwLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb21wLT5wZGF0YS0+Y29udHJvbF9wb2xsX3RpbWVvdXRf
dXNlY3MpOwo+Cj4gSUlVQyB0aGUgY29kZSBmcmFnbWVudCBhYm92ZSBkdXBsaWNhdGVzICdydnRy
YWNlX2Rpc2FibGVfY29tcG9uZW50JyBmcm9tCj4gcnZ0cmFjZS1jb3JlLmMuCj4KSSB3aWxsIHJl
cGxhY2UgYm90aCBvZiB0aGVzZSB3aXRoIGNhbGxzIHRvIHRoZSByZXNwZWN0aXZlIGNvcmUgZnVu
Y3Rpb25zLgo+ID4gKyAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKCZj
b21wLT5kZXYsICJmYWlsZWQgdG8gZGlzYWJsZSBlbmNvZGVyLlxuIik7Cj4gPiArICAgICAgICAg
ICAgIHJldHVybiByZXQ7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICByZXR1cm4gcnZ0cmFj
ZV9jb21wX3BvbGxfZW1wdHkoY29tcCk7Cj4gPiArfQo+Cj4gUmVnYXJkcywKPiBTZXJnZXkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
